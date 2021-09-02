<?php 
    class AccountDA{
        public function AccountDataAccess($what, $param){ 
            switch ($what) { 
                //******************p000account************************
                // p000account(id,IdRole,name,email,phone,address,role,created_date)
                // Get all data from 0 staff
                case 0: {
                    return "SELECT * FROM p000account";
                }

                // Insert data to p000account
                case 1: {
                    return "INSERT INTO p000account(IdRole,name,email,phone,address,img)
                            VALUES('$param->IdRole','$param->name','$param->email','$param->phone','$param->address','$param->img')";
                }

                // Update data p000account
                case 2: {
                    return "UPDATE p000account SET name='$param->name',IdRole='$param->IdRole', email='$param->email', phone='$param->phone',address='$param->address', role='$param->role', created_date = '$param->created_date1'
                            WHERE id='$param->id'";
                }

                // Delete data of p000account
                case 3: {
                    return "DELETE FROM p000account
                            WHERE id IN($param->listid)";
                }

                // check gmail candidate
                case 4: {
                    return "SELECT email FROM p000account
                            WHERE email = '$param->email'";
                }

                // login candidate
                case 5: {
                    return "SELECT * FROM p000account
                            WHERE email='$param->email' AND password='$param->password'";
                }

                // get staff with id
                case 6: {
                    return "SELECT * FROM p000account WHERE id='$param->id'";
                }

                // change pass md5
                case 7: {
                    return "UPDATE p000account SET password='$param->password' WHERE id='$param->id'";
                }

                // update info staff
                case 8: {
                    return "UPDATE p000account SET name='$param->name' WHERE id='$param->id'";
                }

                // update info avatar
                case 9: {
                    return "UPDATE p000account SET img='$param->img' WHERE id='$param->id'";
                }

                // Select with pagination(offset, number-item-in-page) p000account
                case 10: {
                    return "SELECT * FROM p000account
                            LIMIT $param->offset, $param->limit";
                }

                // Count number item of p000account
                case 11: {
                    return "SELECT COUNT(1) FROM p000account ";
                }
            }
        }
    }
?> 
