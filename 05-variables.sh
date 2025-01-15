#!/bin/bash

echo "Please enter your name:"

read Username #TAKES INPUT INTO USERNAME variable

echo "Your name is: $Username"

echo "Please enter your Lover Name:"

read -s PASSWORD
echo "$Username Lover name is: $PASSWORD"
echo "$Username Loves $PASSWORD"
echo "And"
echo "$PASSWORD Loves $Username"