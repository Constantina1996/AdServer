<?php require('includes/config.php'); 
//if not logged in redirect to login page
if(!$user->is_logged_in()){ header('Location: index.php'); exit(); }
else{
    $stmt = $db->prepare('SELECT keywordsAboutInterests FROM users WHERE userID = :userID');
    $stmt->bindParam(':userID',$_SESSION['userID']);
				$stmt->execute();
				 $arr=array();
				 while($result=$stmt->fetch(PDO::FETCH_ASSOC)){
                                 $str=$result["keywordsAboutInterests"];

                              }
                              $pieces=explode(" ",$str);
                              $my_file = './gorgias_visual/gorgias-src-0.6d/examples/predicates.pl';
                              $handle = fopen($my_file, 'w') or die('Cannot open file:'.$my_file);
                              for ($i=0; $i<count($pieces); $i++) {
                               $fwrite = fwrite($handle, "interests(".$pieces[$i].")");
                              fwrite($handle,".\n");
                              }
                     $stmt = $db->prepare('SELECT* FROM users WHERE userID = :userID');
                     $stmt->bindParam(':userID',$_SESSION['userID']);
		     $stmt->execute();
	              $arr=array();
		     while($result=$stmt->fetch(PDO::FETCH_ASSOC)){
                     $age=$result["age"];
                     $geo=$result["geo"];
                     $sex=$result["sex"];
                     } 
                     $blockedbypublisher = Array('1' => 1, '2'=>0,'3'=>0,'4'=>0,
                                                 '5'=>0,'6'=>0,'7'=>0,'8'=>0,
                                                 '9'=>0,'10'=>0);
                                                
                     fwrite($handle,"adList([");
                     for($i=1;$i<=10;$i++){
                        if(!$blockedbypublisher[$i])
                            if($i!=10)
                     fwrite($handle,$i.",");
                            else
                            fwrite($handle,$i);
                     }
                     fwrite($handle,"]).");
                     fwrite($handle,"\n");   
                      fwrite($handle,"age(");        
                      $fwrite = fwrite($handle,$age);
                      fwrite($handle,").\ngeography(");        
                      $fwrite = fwrite($handle,$geo);
                        fwrite($handle,").\n");   
                       $fwrite = fwrite($handle,"policy(1)");
                      fwrite($handle,".\n");
                      if($sex=="F")
                       $fwrite = fwrite($handle,"sex(female)");
                      else
                       $fwrite = fwrite($handle,"sex(male)");
                      fwrite($handle,".\n");  
                       

              
				for($i=1;$i<=10;$i++){
			    	$secfil = 'executeGorgias.pl';
                 $handle = fopen($secfil, 'w') or die('Cannot open file:'.$secfil);   
				 fwrite($handle,":-consult('./gorgias_visual/gorgias-src-0.6d/examples/adDecision.pl').");
				 fwrite($handle,"\n"); 
				 fwrite($handle,"askGorgias:-prove([show(ad,$i)],Delta)."); 	
	             fwrite($handle,"\n");       
				 fwrite($handle,'askGorgias:-write("false").');       
				 $cmd = "C:\\xampp\htdocs\AdServ\swipl\bin\swipl.exe -f executeGorgias.pl -g askGorgias,halt";
				 $output = shell_exec(escapeshellcmd($cmd));
                                 if($output!="false")
				 echo "SHOW AD $i   ".$output;
				 echo "\n";
				}
}?>
<?php
//define page title
$title = 'USERS';
$back = 'logout.php';
$textofback = 'Log out';
//include header template
?>

				<p><a href="logout.php">Logout?</a><p>
				<h2>User only page - Welcome <?php echo htmlspecialchars($_SESSION['username'], ENT_QUOTES); ?></h2>
				<hr>
                                
                                
                               