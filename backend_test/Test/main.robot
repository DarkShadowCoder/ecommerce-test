*** Settings ***
Library  SeleniumLibrary
Library  DatabaseLibrary
Resource  ../Ressource/loginBack.robot
Resource  ../Ressource/Variables.robot
*** Keywords ***

*** Test Cases ***
#Test de connection au compte
Test de connection à la base de données
    Connect To Database Using Custom Params  pymysql  database='${db}',user='root', password='',host='127.0.0.1'
Test de recuperation de la listes des produits
    
    ${produit}  Query  select * from tbl_product
    Log Many  ${produit}
    Should Be True  ${produit}
Test de recuperation de la categories de produits
    ${result}  Query  select * from tbl_top_category
    Log Many  ${result}
    Should Be True  ${result}
Test de recuperation des produits du panier
    ${result}  Query  select * from tbl_order
    Log Many  ${result}
    Should Be True  ${result}

Test de recuperation des informations de payement
    ${result}  Query  select * from tbl_payment
    Log Many  ${result}
    Should Be True  ${result}
Test de recuperation des clients
    ${result}  Query  select * from tbl_customer
    Log Many  ${result}
    Should Be True  ${result}
Test de recuperation des produits
    ${result}  Query  select * from tbl_product
    Log Many  ${result}
    Should Be True  ${result}
Test de recuperation des posts
    ${result}  Query  select * from tbl_post
    Log Many  ${result}
    Should Be True  ${result}
Test de mise à jour des informations sur les post
    ${result}  Set Variable  update tbl_post set post_content='${post}' where category_id=3
    Execute Sql String  ${result}
    ${result}  Query  select * from tbl_post
    Should Be True  ${result}
Tests de mise à jour des categories des produits
    ${result}  Set Variable  update tbl_top_category set tcat_name='Black Men' where tcat_id=1
    Execute Sql String  ${result}
    ${result}  Query  select * from tbl_top_category
    Should Be True  ${result}
Test de mise à jour de commande
    ${result}  Set Variable  update tbl_order set quantity='5' where id=1
    Execute Sql String  ${result}
    ${result}  Query  select * from tbl_order
    Should Be True  ${result}
Test de mise à jour des informations des utilisateurs
    ${result}  Set Variable  update tbl_customer set cust_name='Yvan' where cust_id=1
    Execute Sql String  ${result}
    ${result}  Query  select * from tbl_customer
    Should Be True  ${result}

Test de mise à jour des informations de souscription à la newsletter
    ${result}  Set Variable  update tbl_subscriber set subs_email='${email}' where subs_id=0
    Execute Sql String  ${result}
    ${result}  Query  select * from tbl_subscriber
    Should Be True  ${result}
Test de mise à jour de la langue
    ${result}  Set Variable  update tbl_language set lang_value='Cart' where lang_name='Cart'
    Execute Sql String  ${result}
    ${result}  Query  select * from tbl_language
    Should Be True  ${result}
Test de mise à jour des informations des produits
    ${result}  Set Variable  update tbl_product set p_qty=55 where p_id=83
    Execute Sql String  ${result}
    ${result}  Query  select * from tbl_product
    Should Be True  ${result}
Test de mise à jour des produits du panier
    ${result}  Set Variable  update tbl_order set quantity='5' where id=1
    Execute Sql String  ${result}
    ${result}  Query  select * from tbl_order
    Should Be True  ${result}
Test de mise à jour d'un payement
    ${result}  Set Variable  update tbl_payment set paid_amount='50' where id=51
    Execute Sql String  ${result}
    ${result}  Query  select * from tbl_order
    Should Be True  ${result}
Test de gestion des la newsletter
    ${result}  Set Variable  update tbl_subscriber set subs_email='${email}' where subs_id=0
    Execute Sql String  ${result}
    ${result}  Query  select * from tbl_subscriber
    Should Be True  ${result}

Test d'ajout d'un nouveau client
    ${result}  Set Variable  INSERT INTO `tbl_customer` (`cust_id`, `cust_name`, `cust_cname`, `cust_email`, `cust_phone`, `cust_country`, `cust_address`, `cust_city`, `cust_state`, `cust_zip`, `cust_b_name`, `cust_b_cname`, `cust_b_phone`, `cust_b_country`, `cust_b_address`, `cust_b_city`, `cust_b_state`, `cust_b_zip`, `cust_s_name`, `cust_s_cname`, `cust_s_phone`, `cust_s_country`, `cust_s_address`, `cust_s_city`, `cust_s_state`, `cust_s_zip`, `cust_password`, `cust_token`, `cust_datetime`, `cust_timestamp`, `cust_status`) VALUES ('1', 'yvan', 'yvan', 'yvanlandry@outlook.com', '655565565', '237', 'Cameroon', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
    Execute Sql String  ${result}
    ${result}  Query  select * from tbl_product
    Should Be True  ${result}
    
Test d'ajout de produits
    ${result}  Set Variable  INSERT INTO tbl_product (`p_id`, `p_name`, `p_old_price`, `p_current_price`, `p_qty`, `p_featured_photo`, `p_description`, `p_short_description`, `p_feature`, `p_condition`, `p_return_policy`, `p_total_view`, `p_is_featured`, `p_is_active`, `ecat_id`) VALUES ('110', 'Parfum pour homme', '130', '110', '59', 'photo.jpg', 'Ceci est un parfum pour homme', 'Ceci est un parfum pour homme', 'Ceci est un parfum pour homme', 'Ceci est un parfum pour homme', 'Aucun', '0', '0', '1', '24');
    Execute Sql String  ${result}
    ${result}  Query  select * from tbl_product
    Should Be True  ${result}
Test d'ajout de produit dans le panier
    ${result}  Set Variable  INSERT INTO `tbl_order` (`id`, `product_id`, `product_name`, `size`, `color`, `quantity`, `unit_price`, `payment_id`) VALUES ('8', '94', 'Men in black', '235', 'red', '5', '35', '15')
    Execute Sql String  ${result}
    ${result}  Query  select * from tbl_order
    Should Be True  ${result}
Test d'ajout d'une categorie
    ${result}  Set Variable  INSERT INTO `tbl_top_category` (`tcat_id`, `tcat_name`, `show_on_menu`) VALUES ('7', 'Girl', '1')
    Execute Sql String  ${result}
    ${result}  Query  select * from tbl_top_category
    Should Be True  ${result}

Test d'ajout d'un payement
    ${result}  Set Variable  INSERT INTO `tbl_payment` (`id`, `customer_id`, `customer_name`, `customer_email`, `payment_date`, `txnid`, `paid_amount`, `card_number`, `card_cvv`, `card_month`, `card_year`, `bank_transaction_info`, `payment_method`, `payment_status`, `shipping_status`, `payment_id`) VALUES ('30', '25', 'yvan', 'yvanlandry@outlook.com', CURRENT_DATE(), '', '32', '', '', '', '', '', '', '', '', '');
    Execute Sql String  ${result}
    ${result}  Query  select * from tbl_top_category
    Should Be True  ${result}

Test de suppression d'un utilisateur 
    ${result}  Set Variable  DELETE FROM `tbl_customer` WHERE `tbl_customer`.`cust_id` = 1
    Execute Sql String  ${result}
    ${result}  Query  select * from tbl_customer
    Should Be True  ${result}
Test de suppression d'un produit
    ${result}  Set Variable  DELETE FROM `tbl_product` WHERE `tbl_product`.`p_id` = 110
    Execute Sql String  ${result}
    ${result}  Query  select * from tbl_product
    Should Be True  ${result}
    
Test de suppression d'un email de la newsletter
    ${result}  Set Variable  DELETE FROM `tbl_subscriber` WHERE `tbl_subscriber`.`subs_id` = 0
    Execute Sql String  ${result}
    ${result}  Query  select * from tbl_subscriber
    Should Be True  ${result}
Test de suppression d'une categorie
    ${result}  Set Variable  DELETE FROM `tbl_top_category` WHERE `tbl_top_category`.`tcat_id` = 7
    Execute Sql String  ${result}
    ${result}  Query  select * from tbl_top_category
    Should Be True  ${result}
Test de suppression d'un produit du panier
    ${result}  Set Variable  DELETE FROM `tbl_order` WHERE `tbl_order`.`id` = 8
    Execute Sql String  ${result}
    ${result}  Query  select * from tbl_order
    Should Be True  ${result}
Test de supression d'une langue 
    ${result}  Query  select * from tbl_language
    Should Be True  ${result}
Test de suppression d'un payement
    ${result}  Set Variable   DELETE FROM `tbl_payment` WHERE `tbl_payment`.`id` = 30
    Execute Sql String  ${result}
    ${result}  Query  select * from tbl_payment
    Should Be True  ${result}
Test de suppression de commande
    ${result}  Query  select * from tbl_order
    Should Be True  ${result}
Test de note d'un produit
    ${result}  Query  select * from tbl_order
    Should Be True  ${result}
    ${result}  Query  select * from tbl_rating
    Should Be True  ${result}
Test d'ajout d'un utilisateur existant
    ${result}  Query  select * from tbl_order
    Should Be True  ${result}

Test d'ajout d'un produit erroné
    ${result}  Query  select * from tbl_order
    Should Be True  ${result}
Test d'ajout d'une commande erronée
    ${result}  Query  select * from tbl_order
    Should Be True  ${result}
Test d'ajout d'une categorie existante
    ${result}  Query  select * from tbl_order
    Should Be True  ${result}
Test de montée en charge
    ${result}  Query  select * from tbl_order
    Should Be True  ${result}
Test de fermeture de la base de données
    Disconnect From Database
