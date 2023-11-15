*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Resource  ../Ressource/Variables.robot


*** Keywords ***
Ouvrir le navigateur Chrome
    Open Browser  about:blank  Chrome
    Maximize Browser Window
    Go To    ${WEBSITE}
    Wait Until Page Contains Element  xpath=/html/body/div[3]/div/div/div[1]/a/img

*** Variables ***
${count}  Cart ($137)

*** Test Cases ***
Test de connection au site web
    Open Browser  about:blank  ${BROWSER}
    Go To  ${WEBSITE}
    Wait Until Page Contains Element  xpath=/html/body/div[3]/div/div/div[1]/a/img
    Sleep  1s
Test de connection à un compte
    Click Link  xpath=/html/body/div[3]/div/div/div[2]/ul/li[1]/a
    Wait Until Page Contains Element  xpath=/html/body/div[5]/div/h1
    Sleep  2s
    Input Text  xpath=/html/body/div[6]/div/div/div/div/form/div/div[2]/div[1]/input  ${email}
    Sleep  1s
Test d'authentification de l'utilisateur
    Input Password  xpath=/html/body/div[6]/div/div/div/div/form/div/div[2]/div[2]/input  ${password}
    #Click Element  xpath=/html/body/div[6]/div/div/div/div/form/div/div[2]/div[3]/input
    #Wait Until Page Contains Element  xpath=/html/body/div[6]/div/div/div[1]/div/div/img
    Sleep  2s
    Go To  ${WEBSITE}
Test Naviguation dans le site web
    Sleep  3s 

Test Recherche un produit
    Input Text  xpath=/html/body/div[3]/div/div/div[3]/form/div/input  Women's Tea
    Sleep  1s 
    Click Element  xpath=/html/body/div[3]/div/div/div[3]/form/button
    
Test de Consultation du produit
    Click Element  xpath=/html/body/div[6]/div/div/div/div/div/div[1]/div/div[2]/h3/a
    Wait Until Page Contains Element  xpath=/html/body/div[5]/div/div/div/div[2]/div[1]/div[1]/div[1]/div[1]/ul/li[2]/a
    Sleep  2s
Test de Selection de la taille de l'article
    Click Element  xpath=/html/body/div[5]/div/div/div/div[2]/div[1]/div[2]/form/div[1]/div/div[1]/span/span[1]/span/span[2]
    Sleep  1s
Test de de saisi d'information de taille
    Input Text  xpath=/html/body/span/span/span[1]/input  text=35
    Sleep  1s
    Press Keys  xpath=/html/body/span/span/span[2]/ul/li[1]  \\13

Test de Selection la quantité du produit
    Sleep  1s
    Input Text  xpath=/html/body/div[5]/div/div/div/div[2]/div[1]/div[2]/form/div[3]/input  5

Test de lecture de la description du produit
    Sleep  1s
    Click Element  xpath=/html/body/div[5]/div/div/div/div[2]/div[2]/div/ul/li[1]/a
    Sleep  1s

Test de lecture des caracteristiques du produit
    Click Element  xpath=/html/body/div[5]/div/div/div/div[2]/div[2]/div/ul/li[2]/a
    Sleep  1s
Test de lecture des conditions d'utilisation du produit
    Click Element  xpath=/html/body/div[5]/div/div/div/div[2]/div[2]/div/ul/li[3]/a
    Sleep  1s

Test de Lecture de la politique de retour du produit
    Click Element  xpath=/html/body/div[5]/div/div/div/div[2]/div[2]/div/ul/li[4]/a
    Sleep  1s
Test d'Ajout l'article à la carte
    Sleep  1s
    Click Element  xpath=/html/body/div[5]/div/div/div/div[2]/div[1]/div[2]/form/div[4]/input
Test de Verification de l'ajout au panier
    Sleep  2s

Test d'Ajout du meme article au panier
    Sleep  1s
    #Click Element  xpath=/html/body/div[5]/div/div/div/div[2]/div[1]/div[2]/form/div[4]/input
    Sleep  1s
    #Wait Until Page Does Not Contain Element  xpath=/html/body/div[5]/div/div/div/div[2]/div[1]/div[2]/form/div[4]/input

Test deConsulation des produit similaire
    Sleep  1s
    Click Element  xpath=/html/body/div[6]/div/div[2]/div/div/div[1]/div/div[1]/div/div[2]/h3/a
    Wait Until Page Contains Element  xpath=/html/body/div[5]/div/div/div/div[2]/div[1]/div[2]/form
    Sleep  1s
Test d'Ajout le nouveau produit au panier
    Sleep  1s
    Click Element  xpath=/html/body/div[5]/div/div/div/div[2]/div[1]/div[2]/form/div[4]/input
    Sleep  1s
Test de Retour à la page d'acccueil
    Go To    ${WEBSITE}
    Wait Until Page Contains Element   xpath=/html/body/div[3]/div/div/div[1]/a/img
    Sleep  2s
Test de lecture des accessoires pour femmes
    Click Element  xpath=/html/body/div[5]/div/div[1]/div[2]/div/div/a
    #Wait Until Page Contains Element  xpath=/html/body/div[5]/div/h1    
    Sleep  2s
Test de lecture des accessoires pour hommes
    Click Element  xpath=/html/body/div[4]/div/div/div/div/div/ul/li[2]/a
    Sleep  2s
Test de lecture des accessoires pour enfant
    Click Element  xpath=/html/body/div[4]/div/div/div/div/div/ul/li[4]/a
    Sleep  2s
Test de lecture des accessoires d'electroniques
    Click Element  xpath=/html/body/div[4]/div/div/div/div/div/ul/li[5]/a
    Sleep  2s

Test de lecture des accessoires de santé et maison
    Click Element  xpath=/html/body/div[4]/div/div/div/div/div/ul/li[6]/a
    Sleep  2s

Test de Retour à la page d'acccueil
    Go To    ${WEBSITE}
    Wait Until Page Contains Element   xpath=/html/body/div[3]/div/div/div[1]/a/img
    Sleep  2s

Test de Souscription à la newsletter
    Input Text  xpath=/html/body/section/div/div/div/div/form/div/input  ${email}
    Sleep  1s
    Click Element  xpath=/html/body/section/div/div/div/div/form/div/span/button
    Alert Should Be Present
Tets de validation de souscription
    Sleep  1s
    #Wait Until Page Does Not Contain Element  xpath=/html/body/section/div/div/div/div/form/div/span/button
    Go To  ${WEBSITE}
    Sleep  1s
Test de Consultation la page de AboutUs
    Click Element  xpath=/html/body/div[4]/div/div/div/div/div/ul/li[7]/a
    Sleep  2s
Test de Consultation la page de forum
    Click Element  xpath=/html/body/div[4]/div/div/div/div/div/ul/li[8]/a
    Sleep  2s
Test de selection d'une question du forum
    Click Element  xpath=//*[@id="faqAccordion"]/div[1]/div[1]/h4
    Sleep  1s
    Click Element  xpath=//*[@id="faqAccordion"]/div[2]/div[1]/h4
    Sleep  1s
Test d'ajout d'une reponse dans le forum
    Click Element  xpath=//*[@id="faqAccordion"]/div[3]/div[1]/h4
    Sleep  1s
Test d'ajout d'une question dans le forum
    Click Element  xpath=//*[@id="faqAccordion"]/div[4]/div[1]/h4
    Sleep  1s
    Click Element  xpath=//*[@id="faqAccordion"]/div[5]/div[1]/h4
    Sleep  1s

Test Consultation la page de contactUs
    Click Element  xpath=/html/body/div[4]/div/div/div/div/div/ul/li[9]/a
    Sleep  2s

Test de Contact du service client
    Input Text  xpath=/html/body/div[6]/div/div/div/div/div[1]/div/form/div/div[1]/div[1]/input    yvan
    Sleep  1s
    Input Text  xpath=/html/body/div[6]/div/div/div/div/div[1]/div/form/div/div[1]/div[2]/input    ${email}
    Sleep  1s
    Input Text  xpath=/html/body/div[6]/div/div/div/div/div[1]/div/form/div/div[1]/div[3]/input    698076337
    Sleep  1s
    Input Text  xpath=/html/body/div[6]/div/div/div/div/div[1]/div/form/div/div[2]/div/textarea     ${MESSAGE}
Test de retour à l'accueil
    Click Element  xpath=/html/body/div[6]/div/div/div/div/div[1]/div/form/div/div[3]/input
    #Wait Until Page Does Not Contain Element  xpath=/html/body/div[6]/div/div/div/div/div[1]/div/form/div/div[3]/input
    Sleep  2s
    Alert Should Be Present
    Go Back
    Go To  ${WEBSITE}
    Wait Until Page Contains Element  xpath=/html/body/div[3]/div/div/div[2]/ul/li[3]/a
    Sleep  1s
Test de Consultation la liste des produits du panier
    Click Element  xpath=/html/body/div[3]/div/div/div[2]/ul/li[3]/a
    Wait Until Page Contains Element  xpath=/html/body/div[5]/div[1]
    Sleep  1s

Test de Modification la quantité des produits
    Clear Element Text  xpath=/html/body/div[6]/div/div/div/form/div[1]/table/tbody/tr[2]/td[7]/input[3]
    Input Text  xpath=/html/body/div[6]/div/div/div/form/div[1]/table/tbody/tr[2]/td[7]/input[3]  5
    Sleep  1s

Test de modification du produit
    Sleep  2s
Test de changement des details de l'article
    Clear Element Text  xpath=/html/body/div[6]/div/div/div/form/div[1]/table/tbody/tr[3]/td[7]/input[3]
    Input Text  xpath=/html/body/div[6]/div/div/div/form/div[1]/table/tbody/tr[3]/td[7]/input[3]  4
    Sleep  1s
Test de modification de stock de produit pour le panier
    Clear Element Text  xpath=/html/body/div[6]/div/div/div/form/div[1]/table/tbody/tr[3]/td[7]/input[3]
    Input Text  xpath=/html/body/div[6]/div/div/div/form/div[1]/table/tbody/tr[3]/td[7]/input[3]  3

Test de Mise à jour la carte
    Click Button  xpath=/html/body/div[6]/div/div/div/form/div[2]/ul/li[1]/input
    Sleep  1s
Test de suppression de la carte
    Alert Should Be Present 
    Press Keys  None  \\13
    Go Back

Test de Suppession d'un produit de la carte
    Click Element  xpath=/html/body/div[6]/div/div/div/form/div[1]/table/tbody/tr[2]/td[9]/a/i
    Sleep  1s
    Alert Should Be Present
    Press Keys  None  \\13

Test de retour
    Go To  ${WEBSITE}
    Sleep  1.5s
Test de Visite de la page Facebook du site web
    
    Click Element  xpath=/html/body/div[2]/div/div/div[2]/div/ul/li[1]/a
    Wait Until Page Does Not Contain Element  xpath=/html/body/div[2]/div/div/div[2]/div/ul/li[1]/a
    Sleep  2s

Test de Visite de la page Twitter du site web
    Go To  ${WEBSITE}
    Sleep  1.5s
    Click Element  xpath=/html/body/div[2]/div/div/div[2]/div/ul/li[2]/a
    Wait Until Page Does Not Contain Element  xpath=/html/body/div[2]/div/div/div[2]/div/ul/li[1]/a
    Sleep  2s

Test Visite de la page Youtube du site web
    Go To  ${WEBSITE}
    Sleep  1.5s
    Click Element  xpath=/html/body/div[2]/div/div/div[2]/div/ul/li[3]/a
    Wait Until Page Does Not Contain Element  xpath=/html/body/div[2]/div/div/div[2]/div/ul/li[1]/a
    Sleep  2s

Test Visite la page Instagram du site web
    Go To  ${WEBSITE}
    Sleep  1.5s
    Click Element  xpath=/html/body/div[2]/div/div/div[2]/div/ul/li[4]/a
    Wait Until Page Does Not Contain Element  xpath=/html/body/div[2]/div/div/div[2]/div/ul/li[1]/a
    Sleep  2s

Test de Visite la page WhatsApp du site web
    Go To  ${WEBSITE}
    Sleep  1.5s
    Click Element  xpath=/html/body/div[2]/div/div/div[2]/div/ul/li[5]/a
    Wait Until Page Does Not Contain Element  xpath=/html/body/div[2]/div/div/div[2]/div/ul/li[1]/a
    Sleep  2s
    Go Back


Test de deconexion du navigateur
    Close Browser