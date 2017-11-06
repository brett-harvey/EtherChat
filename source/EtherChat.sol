/*****************
File: EtherChat.sol

Title: EtherChat - Chat with friends on the Ethereum Blockchain
Purpose: Send and receive messages to friends, and add friends as contacts.

Author Name: Brett Harvey

To Compile: $ truffle compile
To Run:
$ truffle console
> etherchat.deployed().then(function(instance) { etherchatContract = instance });
*****************/

pragma solidity ^0.4.16;

contract EtherChat {
  struct Message {
    address Sender;
    address Recipient;
    string TitleOfMessage;
    string MessageContents;
  }

  mapping (address => uint) public ECHAT;

  mapping (address => string) public Username;
  mapping (address => mapping (uint => Message)) public myMessage;
  mapping (address => uint) NumberOfMessages;

  event NewMsg(address recip, address sender, string title, string contents);

  function SendMessage(address _recip, string _title, string _contents) payable {
    Message NewMessage = Message(msg.sender, _recip, _title, _contents);
    MyMessage[_recip][NumberOfMessages[_recip]] = NewMessage;
    NumberOfMessages[_recip]++;
    NewMsg(_recip, msg.sender, _title, _contents);
  }

  function GetMessageSenderUsername(uint i) public constant returns (string) {
    Message msgSender = MyMessage[msg.sender][i];
    return ContactName[msgSender.Sender];
  }

  function GetMessageSenderAddress(uint _i_) public constant returns (address) {
    Message _Sender = MyMessage[msg.sender][i];
    return _Sender;
  }

  function GetMessageTitle(uint i_) public constant returns (string) {
    Message msgTitle  MyMessage[msg.sender][i_];
    return msgTitle.TitleOfMessage;
  }

  function GetMessageContent(uint _i) public constant returns (string) {
    MyMessage[msg.sender][_i];
  }

  function GetEtherBalance() public constant returns (uint) {
    return msg.balance;
  }

  function GetTokenBalance() public constant returns (uint) {
    return ECHAT[msg.sender];
  }

  function CreateMyUsername(string username) {
    Username[msg.sender] = username;
  }
}
