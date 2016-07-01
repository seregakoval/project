<?php

include "libmail.php";



	$m = new Mail();
	//$m->smtp_on('',)
	$m->From( "info@design-online.cz" );
	$m->To("info@design-online.cz");
	
	
	if (isset($_POST['contact-us'])) {
		$m->Subject('Сообщение с контактной формы');
		$body   =   '<p><b>Имя:</b> '.$_POST['name'].'</p>'
			 .'<p><b>Телефон</b> '.$_POST['phone'].'</p>'
			 .'<p><b>Сообщение:</b> '.$_POST['message'].'</p>'; 
		echo "thanks";	 
	}
	
	elseif (isset($_POST['order-call'])) {
		$m->Subject('Заказали звонок');
		$body   =   '<p><b>Имя:</b> '.$_POST['name'].'</p>'
			 .'<p><b>Телефон:</b> '.$_POST['phone'].'</p>';
		echo "thanks";	 
	}
	
	elseif (isset($_POST['order'])) {
		$m->Subject('Количество компьютеров в офисе');
		$body   =   '<p><b>Количество компьютеров в офисе:</b> '.$_POST['quant'].'</p>'
			 .'<p><b>Имя:</b> '.$_POST['name'].'</p>'
             .'<p><b>Телефон:</b> '.$_POST['phone'].'</p>';
		echo "thanks";	 
	}
	

	$m->Body($body, 'html');
	$m->Send();
?>