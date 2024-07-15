/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.AccountDTO;
import DTO.AdminDTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author msi
 */
public class AccountDAO extends DBcontext {

    public AdminDTO checkLogin(String username, String password) {
        String sql = "SELECT * FROM Administrator WHERE Username = ? AND Password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AdminDTO account = new AdminDTO();
//                account.setAccountID(rs.getInt(1));
//                account.setUsername(rs.getString(2));
//                account.setPassword(rs.getString(3));
//                account.setFullname(rs.getString(4));
//                account.setPhone(rs.getString(5));
//                account.setEmail(rs.getString(6));
//                account.setAddress(rs.getString(7));
//                account.setQue(rs.getString(8));
//                account.setRole(rs.getInt(9));
                account.setAdminID(rs.getInt(1));
                account.setUserName(rs.getString(2));
                account.setPassword(rs.getString(3));
                account.setLastLogin(rs.getString(4));
                account.setIsActive(rs.getInt(5));
                account.setRoleID(rs.getInt(6));
                account.setEmail(rs.getString(7));
                account.setImg(rs.getString(8));
                account.setAdminName(rs.getString("adminName"));
//                    private int adminID;
//    private String userName;
//    private String password;
//    private String lastLogin;
//    private int isActive;
//    private int roleID;
//    private String email;
//    private String img;
                return account;
            }
        } catch (Exception e) {
            System.out.println("AccountDAO - checkLogin: " + e.getMessage());
        }
        return null;
    }
public AdminDTO checkLogin1(String username, String password) {
        String sql = "SELECT * FROM Administrator WHERE Username = ? AND Password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AdminDTO account = new AdminDTO();
//                account.setAccountID(rs.getInt(1));
//                account.setUsername(rs.getString(2));
//                account.setPassword(rs.getString(3));
//                account.setFullname(rs.getString(4));
//                account.setPhone(rs.getString(5));
//                account.setEmail(rs.getString(6));
//                account.setAddress(rs.getString(7));
//                account.setQue(rs.getString(8));
//                account.setRole(rs.getInt(9));
                account.setAdminID(rs.getInt(1));
                account.setUserName(rs.getString(2));
                account.setPassword(rs.getString(3));
                account.setLastLogin(rs.getString(4));
                account.setIsActive(rs.getInt(5));
                account.setRoleID(rs.getInt(6));
                account.setEmail(rs.getString(7));
                account.setImg(rs.getString(8));

//                    private int adminID;
//    private String userName;
//    private String password;
//    private String lastLogin;
//    private int isActive;
//    private int roleID;
//    private String email;
//    private String img;
                return account;
            }
        } catch (Exception e) {

        }
        return null;
    }
    public int getTotalNewAccount() {
        String sql = "SELECT COUNT(AccountID) AS Count\n"
                + "FROM Account\n"
                + "WHERE CAST(DateCreate AS DATE) = CAST(GETDATE() AS DATE) and Role = 0;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            int Count = 0;
            if (rs.next()) {
                Count = rs.getInt("Count");
            }
            return Count;
        } catch (SQLException e) {
            System.out.println("AccountDAO - getTotalNewAccount: " + e.getMessage());
        }
        return 0;
    }

    public int getTotalAccount() {
        String sql = "SELECT COUNT(AccountID) AS Count from Account";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            int Count = 0;
            if (rs.next()) {
                Count = rs.getInt("Count");
            }
            return Count;
        } catch (SQLException e) {
            System.out.println("AccountDAO - getTotalAccount: " + e.getMessage());
        }
        return 0;
    }

    //dang ky 
    public AccountDTO register(String fullname, String username, String password, String Email, String num) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([Username]\n"
                + "           ,[Password]\n"
                + "           ,[Fullname]\n"
                + "           ,[Phone]\n"
                + "           ,[Email]\n"
                + "           ,[Address]\n"
                + "           ,[Question]\n"
                + "           ,[Role])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,'1'\n"
                + "           ,'1'\n"
                + "           ,0)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, fullname);
            ps.setString(4, num);
            ps.setString(5, Email);

            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("AccountDAO - register: " + ex.getMessage());
        }
        return null;
    }
//check gmail

    public AccountDTO checkgmail(String Email) {
        String sql = "SELECT [Email]\n"
                + "  FROM [dbo].[Account] where Email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, Email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AccountDTO accountDTO = new AccountDTO();
                accountDTO.setEmail(rs.getString("Email"));
                return accountDTO;
            }
        } catch (SQLException ex) {
            System.out.println("AccountDAO - checkgmail: " + ex.getMessage());
        }
        return null;
    }

    public ArrayList<AccountDTO> getlistcheckgmail(String Email) {
        ArrayList<AccountDTO> la = new ArrayList<>();
        String sql = "SELECT [Email]\n"
                + "  FROM [dbo].[Account] where Email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, Email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AccountDTO accountDTO = new AccountDTO();
                accountDTO.setEmail(rs.getString("Email"));
                la.add(accountDTO);
            }
        } catch (SQLException ex) {
            System.out.println("AccountDAO - getlistcheckgmail: " + ex.getMessage());
        }
        return la;
    }

    //check username
    public AdminDTO checkuser(String username) {
        String sql = "select * from Administrator where userName = ? ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AdminDTO accountDTO = new AdminDTO();
                accountDTO.setAdminID(rs.getInt(1));
                accountDTO.setAdminName(rs.getString("Username"));
                return accountDTO;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public AccountDTO searchAccountByColumn(String columnName, String input) {
        String sql = "SELECT * FROM Account WHERE [" + columnName + "] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, input);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AccountDTO account = new AccountDTO();
                account.setAccountID(rs.getInt(1));
                account.setUsername(rs.getString(2));
                account.setPassword(rs.getString(3));
                account.setFullname(rs.getString(4));
                account.setPhone(rs.getString(5));
                account.setEmail(rs.getString(6));
                account.setAddress(rs.getString(7));
                account.setRole(rs.getInt(8));
                return account;
            }
        } catch (Exception e) {
            System.out.println("AccountDAO - searchAccountByColumn: " + e.getMessage());
        }
        return null;
    }

    public List<AdminDTO> getAllAccount() {
        String sql = "SELECT * FROM Administrator";
        ArrayList<AdminDTO> la = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AdminDTO account = new AdminDTO();
                account.setAdminID(rs.getInt(1));
                account.setUserName(rs.getString(2));
                account.setPassword(rs.getString(3));
                account.setLastLogin(rs.getString(4));
                account.setIsActive(rs.getInt(5));
                account.setRoleID(rs.getInt(6));
                account.setEmail(rs.getString(7));
                account.setImg(rs.getString(8));
                la.add(account);
            }
        } catch (Exception e) {
            System.out.println("AccountDAO - getAllAccount: " + e.getMessage());
        }
        return la;
    }

    public List<AccountDTO> searchAccount(String txtSearch) {
        String sql = "SELECT * FROM Account\n"
                + "where [Fullname] like ?";
        ArrayList<AccountDTO> la = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AccountDTO account = new AccountDTO();
                account.setAccountID(rs.getInt(1));
                account.setUsername(rs.getString(2));
                account.setPassword(rs.getString(3));
                account.setFullname(rs.getString(4));
                account.setPhone(rs.getString(5));
                account.setEmail(rs.getString(6));
                account.setAddress(rs.getString(7));
                account.setQue(rs.getString(8));
                account.setRole(rs.getInt(9));
                la.add(account);
            }
        } catch (Exception e) {
            System.out.println("AccountDAO - searchAccount: " + e.getMessage());
        }
        return la;
    }

    public AccountDTO getgmailupdate(String pass, String gmail) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [Password] = ?\n"
                + " WHERE [Email]  = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setString(2, gmail);
            int rowsAffected = ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("AccountDAO - getgmailupdate: " + ex.getMessage());
        }
        return null;
    }

    public static void main(String[] args) {
//        AccountDTO accountDTO = new AccountDTO();
//        AccountDAO adao = new AccountDAO();
//
//        int check = adao.changePassword("12344", 2);
//        System.out.println(check);
        AccountDAO adao = new AccountDAO();

        List<AdminDTO> la = adao.getAllAccount();
        for (AdminDTO a : la) {
            System.out.println(a);
        }
    }

    public int updateProfile(AdminDTO accountDTO) {
        String sql = """
                     UPDATE [dbo].Administrator
                     SET [Username] = ?,
                     [adminName] = ?,
                     [email] = ?,
                     [img] = ?
                     WHERE administratorID = ?""";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            System.out.println("Object: " + accountDTO.getUserName());
            ps.setString(1, accountDTO.getUserName());
            ps.setString(2, accountDTO.getAdminName());
            ps.setString(3, accountDTO.getEmail());
            ps.setString(4, accountDTO.getImg());
            ps.setInt(5, accountDTO.getAdminID());
            int checkUpdate = ps.executeUpdate();
            return checkUpdate;

        } catch (SQLException e) {
            System.out.println("updateProfile: " + e.getMessage());
        }
        return 0;
    }

    public AdminDTO getAccountById(int aid) {
        String sql = "select * from Administrator where administratorID = ?";
        AdminDTO accountDTO = new AdminDTO();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, aid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                accountDTO.setAdminID(aid);
                accountDTO.setUserName(rs.getString(2));
                accountDTO.setPassword(rs.getString(3));
                accountDTO.setLastLogin(rs.getString(4));
                accountDTO.setIsActive(rs.getInt(5));
                accountDTO.setRoleID(rs.getInt(6));
                accountDTO.setEmail(rs.getString(7));
                accountDTO.setImg(rs.getString(8));
                accountDTO.setAdminName(rs.getString(9));
            }

            return accountDTO;

        } catch (SQLException e) {
            System.out.println("getAccountById: " + e.getMessage());
        }
        return null;
    }

    public boolean changePassword(String newpass, int uid) {
        String sql = """
                     UPDATE [dbo].[Administrator]
                     SET [password] = ?
                     WHERE administratorID = ?
                     """;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, newpass);
            ps.setInt(2, uid);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("changePassword: " + e.getMessage());
        }
        return false;
    }
}
