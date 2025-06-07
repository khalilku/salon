#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~"
echo -e "\nWelcome to My Salon, how can I help you?\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # SERVICES=$($PSQL "SELECT * FROM services;")
  # echo "$SERVICES" | while read ID BAR NAME
  # do
    # echo "$ID) $NAME"
  # done
  GET_SERVICES

  read SERVICE_ID_SELECTED

  if [ $SERVICE_ID_SELECTED == "e" ]
  then
    EXIT
  fi

  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    # MAIN_MENU "I could not find that service. What would you like today?"
    GET_SERVICES
  fi

  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_ID ]]
  then
    GET_SERVICES
  fi

  SET_APPOINTMENT $SERVICE_ID_SELECTED
}

GET_SERVICES() {
  SERVICES=$($PSQL "SELECT * FROM services;")
  echo "$SERVICES" | while read ID BAR NAME
  do
    echo "$ID) $NAME"
  done
}

SET_APPOINTMENT() {
  SERVICE_ID=$1
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  PHONE_EXISTS=$($PSQL "SELECT * FROM CUSTOMERS WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $PHONE_EXISTS ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID")
  FORMATTED_NAME=$(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')
  echo -e "\nWhat time would you like your cut, $FORMATTED_NAME?"
  read SERVICE_TIME

  APPOINTMENT=$($PSQL "INSERT INTO appointments (time, customer_id, service_id) VALUES ('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID)")
  FORMATTED_SERVICE=$(echo $SERVICE | sed -E 's/^ *| *$//g')
  echo -e "\nI have put you down for a $FORMATTED_SERVICE at $SERVICE_TIME, $FORMATTED_NAME."
}

EXIT() {
  echo -e "\nThank you for stopping by."
}
MAIN_MENU
