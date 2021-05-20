pragma solidity ^0.4.24;

contract Register
{
    struct Customer
    {
        string email;
        string name;
        string password;
    }
    
    struct Account
    {
        string email;
        string name;
        uint   mobile;
        string gstin;
        string identity_type;
        string identity;
        string business;
    }
    
    struct Transaction
    {
        string gstin;
        string billNumber;
        uint   amount;
        string business;
    }
    
    Customer[] customers;
    Account[] accounts;
    Transaction[] transactions;
    uint private bill=76868;
    
    
    function setUser(string _email, string _name,  string _password) public
    {
        customers.push(Customer({name:_name,email:_email,password:_password}));
    }
    
    function getEmailExsist(string _email) public view returns(bool)
    {
        for(uint i=0;i<customers.length;i++)
        {
            if(keccak256(abi.encodePacked(customers[i].email)) == keccak256(abi.encodePacked(_email)))
            {
                return true;
            }
        }
        return false;
    }
    
    function getUserExsist(string _email, string _password) public view returns(bool)
    {
        for(uint i=0;i<customers.length;i++)
        {
            if(keccak256(abi.encodePacked(customers[i].email,customers[i].password)) == keccak256(abi.encodePacked(_email,_password)))
            {
                return true;
            } 
        }
        return false;
    }
    
    function getProfile(string _email) public view returns(string ,string)
    {
        for(uint i=0;i<customers.length;i++)
        {
            if(keccak256(abi.encodePacked(customers[i].email)) == keccak256(abi.encodePacked(_email)))
            {
                break;
            }
        }
        
        return(customers[i].name,customers[i].email);
    }
    
    function setAccount(string _email, string _name, uint _mobile, string _gstin, string _identity_type, string _identity, string _business) public
    {
        accounts.push(Account({email:_email,name:_name,mobile:_mobile,gstin:_gstin,identity_type:_identity_type,identity:_identity,business:_business}));
    }
    
    function getAccountExsist(string _email,string _gstin) public view returns(bool)
    {
        for(uint i=0;i<accounts.length;i++)
        {
            if(keccak256(abi.encodePacked(accounts[i].email,accounts[i].gstin)) == keccak256(abi.encodePacked(_email,_gstin)))
            {
                return true;
            } 
        }
        return false;
    }
    
    function getAccount(string _email) public view returns(string , uint, string, string, string, string)
    {
        for(uint i=0;i<accounts.length;i++)
        {
            if(keccak256(abi.encodePacked(accounts[i].email)) == keccak256(abi.encodePacked(_email)))
            {
                break;
            } 
        }
        return(accounts[i].name,accounts[i].mobile,accounts[i].gstin,accounts[i].identity_type,accounts[i].identity,accounts[i].business);
    }
    
    function setBillNo(uint _bill) public
    {
        bill=_bill;
    }
    
    function getBillNo() public view returns(uint)
    {
        return bill;
    }
    
    function setDetails(string _gstin, string _billNumber, uint _amount, string _business) public
    {
        transactions.push(Transaction({gstin:_gstin,billNumber:_billNumber,amount:_amount,business:_business}));
    }
    
    function getDetails(string _gstin) public view returns(string, uint, string)
    {
        for(uint i=0;i<transactions.length;i++)
        {
            if(keccak256(abi.encodePacked(transactions[i].gstin)) == keccak256(abi.encodePacked(_gstin)))
            {
                return(transactions[i].gstin,transactions[i].amount,transactions[i].billNumber);
            } 
        }
    }
    
    
}