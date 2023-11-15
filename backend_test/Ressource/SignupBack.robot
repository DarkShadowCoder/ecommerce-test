*** Settings ***
Library  SeleniumLibrary
Library  DatabaseLibrary
Library  RequestsLibrary
Resource  ../Ressource/Variables.robot
Library  pymysql


*** Keywords ***
Verifier si l'utilisateur n'existe pas dans la base de données
    Connect To Database Using Custom Params  pymysql  database='demo',user='root', password='',host='127.0.0.1'
    Row Count Is 0  select id from users where username = '${pseudo}' and password = md5('${password}')

Inscription utilisateurs par une requete http
    Create Session  session1  ${web_site_link}
    ${data}  Create Dictionary  username=${pseudo}  password=${password}
    ${headers}  Create Dictionary  Content-Type=application/x-www-form-urlencoded
    ${response}  POST On Session  session1  signup.php  data=${data}  headers=${headers}
    Log  ${response}
    ${json}  Set Variable  ${response.json()}
    Log  ${json}
    Should Be Equal As Strings  ${response.status_code}  200
    Should Be Equal As Strings  ${json['message']}  Successfully Signup! 

Verifier si l'utilisateur est ajoutée dans la base de données 
    Connect To Database Using Custom Params  pymysql  database='demo',user='root',password='',host='127.0.0.1'
    Row Count Is Equal To X      select id from users where username='${pseudo}' and password = md5('${password}')  1

Inscription du meme utilisateur par une requete http post
    Create Session  session2  ${web_site_link}
    ${data}  Create Dictionary  username=${pseudo}  password=${password}
    ${headers}  Create Dictionary  Content-Type=application/x-www-form-urlencoded
    ${response}  POST On Session  session2  signup.php  data=${data}  headers=${headers}
    ${json}  Set Variable  ${response.json()}
    Should Be Equal As Strings  ${response.status_code}  200
    Should Be Equal As Strings  ${json['message']}  username already exists!

Verifier que l'utilisateur n'est pas dupliqué dans la base de données
    Connect To Database Using Custom Params  pymysql  database='demo',user='root', password='',host='127.0.0.1'
    Row Count Is Equal To X  select id from users where username = '${pseudo}' and password = md5('${password}')  1
    
