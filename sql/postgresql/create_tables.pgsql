/* $Id$
    Todo:
    - add foreign key constrains (will prevent inconsistence
    - add / remove indexes depending on performance 
*/

CREATE SEQUENCE alias_idnr_seq;
CREATE TABLE aliases (
    alias_idnr INT8 DEFAULT nextval('alias_idnr_seq'),
    alias VARCHAR(100) NOT NULL, 
    deliver_to VARCHAR(250) NOT NULL,
    client_id INTEGER DEFAULT '0' NOT NULL,
    PRIMARY KEY (alias_idnr)
);
CREATE INDEX alias_idx ON aliases (alias);



CREATE SEQUENCE user_idnr_seq;
CREATE TABLE users (
   user_idnr INT8 DEFAULT nextval('user_idnr_seq'),
   userid VARCHAR(100) NOT NULL,
   passwd VARCHAR(32) NOT NULL,
   client_id INTEGER DEFAULT '0' NOT NULL,
   maxmail_size INT8 DEFAULT '0' NOT NULL,
   PRIMARY KEY (user_idnr)
);
CREATE UNIQUE INDEX userid_idx ON users (userid);



CREATE SEQUENCE mailbox_idnr_seq;
CREATE TABLE mailboxes (
   mailbox_idnr INT8 DEFAULT nextval('mailbox_idnr_seq'),
   owner_idnr INTEGER NOT NULL,
   name VARCHAR(100) NOT NULL,
   seen_flag INT2 DEFAULT '0' NOT NULL,
   answered_flag INT2 DEFAULT '0' NOT NULL,
   deleted_flag INT2 DEFAULT '0' NOT NULL,
   flagged_flag INT2 DEFAULT '0' NOT NULL,
   recent_flag INT2 DEFAULT '0' NOT NULL,
   draft_flag INT2 DEFAULT '0' NOT NULL,
   no_inferiors INT2 DEFAULT '0' NOT NULL,
   no_select INT2 DEFAULT '0' NOT NULL,
   permission INT2 DEFAULT '2',
   is_subscribed INT2 DEFAULT '0' NOT NULL,
   PRIMARY KEY (mailbox_idnr)
);
CREATE INDEX name_idx ON mailboxes (name);



CREATE SEQUENCE message_idnr_seq;
CREATE TABLE messages (
   message_idnr INT8 DEFAULT nextval('message_idnr_seq'),
   mailbox_idnr INT8 DEFAULT '0' NOT NULL,
   messagesize INT8 DEFAULT '0' NOT NULL,
   seen_flag INT2 DEFAULT '0' NOT NULL,
   answered_flag INT2 DEFAULT '0' NOT NULL,
   deleted_flag INT2 DEFAULT '0' NOT NULL,
   flagged_flag INT2 DEFAULT '0' NOT NULL,
   recent_flag INT2 DEFAULT '0' NOT NULL,
   draft_flag INT2 DEFAULT '0' NOT NULL,
   unique_id varchar(70) NOT NULL,
   internal_date DATETIME,
   status INT2 DEFAULT '000' NOT NULL,
   PRIMARY KEY (message_idnr)
);
CREATE INDEX status_idx ON messages (status);



CREATE SEQUENCE messageblk_idnr_seq;
CREATE TABLE messageblks (
   messageblk_idnr INT8 DEFAULT nextval('messageblk_idnr_seq'),
   message_idnr INT8 DEFAULT '0' NOT NULL,
   messageblk TEXT NOT NULL,
   blocksize INT8 DEFAULT '0' NOT NULL,
   PRIMARY KEY (messageblk_idnr)
);



CREATE TABLE config (
	config_idnr INTEGER DEFAULT '0' NOT NULL,
	item VARCHAR(128) NOT NULL,
	value VARCHAR(128) NOT NULL
);
CREATE UNIQUE INDEX item_idx ON config (item);
CREATE UNIQUE INDEX value_idx ON config (value);
