#!/bin/bash

user=$1
pass=$2

get_cookie=$(curl -i -d "username=$user&userpassword=$pass&id_prodi=10003" https://akademik.unsri.ac.id/portal02/login/proses_login.php | grep Set-Cookie | cut -d " " -f 2,3)
curl -H "Cookie: $get_cookie" -d "inp_tak_history1=2023&inp_tak_history2=2024&inp_tak_history3=1" https://akademik.unsri.ac.id/portal02/module/data_akademik/khs/update.php | html2text | sed -n '/Home/,$p'
