import java.io.Serializable;

public class Account implements Serializable {
    private static final long serialVersionUID = 1L;

    private String account;
    private int accountMoney;

    public Account(String account, int accountMoney) {
        this.account = account;
        this.accountMoney = accountMoney;
    }

    @Override
    public String toString() {
        return "Account{" +
                "account='" + account + '\'' +
                ", accountMoney=" + accountMoney +
                '}';
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public int getAccountMoney() {
        return accountMoney;
    }

    public void setAccountMoney(int accountMoney) {
        this.accountMoney = accountMoney;
    }

    public Account() {
    }
}
