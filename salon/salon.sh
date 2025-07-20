#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"
MAIN_MENU() {
  echo "Welcome to My Salon, how can I help you?"
  # get services
  SERVICES_RESULT=$($PSQL "SELECT service_id, name FROM services")
  # list the services
  echo "$SERVICES_RESULT" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo -e "$SERVICE_ID) $SERVICE_NAME"
  done
   # ask for service to get
  read SERVICE_ID_SELECTED
  # if selected service is not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat's not a valid service."
    MAIN_MENU
  else
    # check availability of picket service
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    # if selected service dosen't exists
    if [[ -z $SERVICE_NAME ]]
    then
      echo -e "The service you selected doesn't exists.\n"
      MAIN_MENU
    else
      # ask for phone number and name to set appointment
      echo -e "\nWhat's you phone number:"
      read CUSTOMER_PHONE
      # if phone doesn't exists yet
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
      if [[ -z $CUSTOMER_NAME ]]
      then
        # ask for customer name
        echo -e "\nWhat's your name:"
        read CUSTOMER_NAME
        # register new customer
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
      fi
      # get customer id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      # ask for appointment time
      echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?\nBusiness hours: From 8:00am to 9:00pm"
      read SERVICE_TIME
      # insert appointment
      INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
      if [[ $INSERT_APPOINTMENT_RESULT == 'INSERT 0 1' ]]
      then
        echo -e "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"
      fi
    fi
  fi
}
MAIN_MENU