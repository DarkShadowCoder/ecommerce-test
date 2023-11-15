*** Settings ***
Library  SeleniumLibrary
Library  DatabaseLibrary
Library  RequestsLibrary
Resource  ../Ressource/variables.robot


*** Keywords ***
Verifier si l'utilisateur existe dans la base de données
    Connect To Database Using Custom Params  pymysql  database='demo',user='root', password='',host='127.0.0.1'
    Row Count Is Equal To X  select id from users where username = '${pseudo}' and password=md5('${password}')  1

Authentifier l'utilisateur dans l'application
    Create Session    session3    ${web_site_link}
    ${response}  Get Request  session3  login.php?username=${pseudo}&password=${password}
    ${json}  Set Variable  ${response.json()}
    Log  ${json}
    Should Be Equal As Strings  ${response.status_code}  200
    Should Be Equal As Strings  ${json['message']}  Successfully Login!

Supprimer un Utilisateur de la Base de données
    Connect To Database Using Custom Params  pymysql  database='demo',user='root', password='',host='127.0.0.1'
    Execute Sql String  DELETE FROM users WHERE username= '${pseudo}' and password=md5('${password}')
    Disconnect From Database

Authentifier à nouveau l'utilisateur dans la base de données
    Create Session  session4  ${web_site_link}
    ${response}  Get Request  session4  login.php?username=${pseudo}&password=${password}
    ${json}  Set Variable  ${response.json()}
    Should Be Equal As Strings  ${response.status_code}  200
    Should Be Equal As Strings  ${json['message']}  Invalid Username or Password!


