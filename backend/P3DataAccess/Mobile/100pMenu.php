<?php                                                                                      
	class MenuDA{				
		public function MenuDataAccess($what, $param){ 			
            switch ($what) {                                                                 
                //******************p100Menu************************             
                // p100Menu(id,IdParentMenu,IsGroup,Name,Slug,Icon,Position)
                // Get all data from p100Menu
                case 100: {                                                                        
                    return "SELECT * FROM p100Menu";
                }                                                                                  
                                                                                                   
                // Insert data to p100Menu
                case 101: {                                                                        
                    return "INSERT INTO p100Menu(IdParentMenu,IsGroup,Name,Slug,Icon,Position)
                            VALUES('$param->IdParentMenu','$param->IsGroup','$param->Name','$param->Slug','$param->Icon','$param->Position')";                               
                }                                                                                  
                                                                                                   
                // Update data p100Menu
                case 102: {
                    return "UPDATE p100Menu SET IdParentMenu='$param->IdParentMenu',IsGroup='$param->IsGroup',Name='$param->Name',Slug='$param->Slug',Icon='$param->Icon',Position='$param->Position'
                            WHERE id='$param->id'";                                                 
                }                                                                                  
                                                                                                   
                // Delete data of p100Menu
                case 103: {                                                                        
                    return "DELETE FROM p100Menu
                            WHERE id IN($param->listid)";                                           
                }                                                                                  
                                                                                                   
                // Find data with id p100Menu
                case 104: {                                                                        
                    return "SELECT * FROM p100Menu
                            WHERE id='$param->id'";                                                 
                }                                                                                  
                                                                                                   
                // Select with pagination(offset, number-item-in-page) p100Menu
                case 105: {                                                                        
                    return "SELECT *                                                                              
                            FROM (SELECT id FROM p100Menu ORDER BY id LIMIT $param->offset, $param->limit) T1     
                            INNER JOIN p100Menu T2 ON T1.id = T2.id                                               
                                $param->condition";                                                               
                }                                                                                                 
                                                                                                   
                // Count number item of p100Menu
                case 106: {                                                                        
                    return "SELECT COUNT(1) FROM p100Menu $param->condition";
                }  
                
                // Get all data from p100Menu
                case 107: {                                                                        
                    return "SELECT * FROM p100Menu WHERE IsGroup = '1'";
                } 

                
                // Get all data from p100Menu recusive
                case 108: {                                                                        
                    return "SELECT  t1.*, 
                                    t2.id as id1, 
                                    t2.`IdParentMenu` as IdParentMenu1,
                                    t2.`IsGroup` as IsGroup1,
                                    t2.`Name` as Name1, 
                                    t2.`Slug` as Slug1, 
                                    t2.`Icon` as Icon1, 
                                    t2.`Position` as Position1
                            FROM p100Menu t1 
                                LEFT JOIN p100Menu t2 ON t1.id = t2.IdParentMenu 
                            
                            WHERE t1.IdParentMenu = 0  
                            ORDER BY t1.position, t1.id, t2.position";
                } 

                // Get all data from p100Menu recusive
                case 109: {                                                                        
                    return "SELECT DISTINCT   t1.*, 
                                    t2.id as id1, 
                                    t2.`IdParentMenu` as IdParentMenu1,
                                    t2.`IsGroup` as IsGroup1,
                                    t2.`Name` as Name1, 
                                    t2.`Slug` as Slug1, 
                                    t2.`Icon` as Icon1, 
                                    t2.`Position` as Position1,
                                    t3.id as IdRoleDetail,
                                    t4.id as IdRoleDetail1,
                                    t3.Status,
                                    t4.Status as Status1
                            FROM p100Menu t1 
                                LEFT JOIN p100Menu t2 ON t1.id = t2.IdParentMenu
                                LEFT JOIN (SELECT * FROM p300RoleDetail WHERE idRole = '$param->idRole') t3
                                     ON t1.id = t3.IdMenu  
                                LEFT JOIN (SELECT * FROM p300RoleDetail WHERE idRole = '$param->idRole') t4
                                     ON t2.id = t4.IdMenu  
                            WHERE t1.IdParentMenu = 0   
                                ORDER BY t1.position, t1.id, t2.position";
                }

                // Get all data from p100Menu recusive
                case 110: {                                                                        
                    return "SELECT DISTINCT   t1.*, 
                                t2.id as id1, 
                                t2.`IdParentMenu` as IdParentMenu1,
                                t2.`IsGroup` as IsGroup1,
                                t2.`Name` as Name1, 
                                t2.`Slug` as Slug1, 
                                t2.`Icon` as Icon1, 
                                t2.`Position` as Position1,
                                t3.id as IdRoleDetail,
                                t4.id as IdRoleDetail1,
                                t3.Status,
                                t4.Status as Status1
                        FROM p100Menu t1 
                            LEFT JOIN p100Menu t2 ON t1.id = t2.IdParentMenu
                            LEFT JOIN (SELECT * FROM p300RoleDetail WHERE idRole = (SELECT IdRole FROM p000account WHERE id='$param->idUser')) t3
                                ON t1.id = t3.IdMenu  
                            LEFT JOIN (SELECT * FROM p300RoleDetail WHERE idRole = (SELECT IdRole FROM p000account WHERE id='$param->idUser')) t4
                                ON t2.id = t4.IdMenu  
                        WHERE t1.IdParentMenu = 0   
                            ORDER BY t1.position, t1.id, t2.position";
                } 

                // Get get permission of component
                case 111: {                                                                        
                    return "SELECT t1.Status 
                            FROM p300RoleDetail t1
                                INNER JOIN p200Role t2 on t1.IdRole = t2.id
                                INNER JOIN p000account t3 on t2.id = t3.IdRole
                                INNER JOIN p100Menu t4 on t1.IdMenu = t4.id
                            WHERE t3.id = '$param->idUser'
                                AND t4.Slug = '$param->url'";
                } 


            }                                                                                      
		}                                                                                      
	}                                                                                      
?>                                                                                         
