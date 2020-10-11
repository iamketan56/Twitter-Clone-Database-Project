	create database twitter;
    use twitter;
 	# create user table
	create table users ( id int auto_increment primary key, username varchar(10),created_at TIMESTAMP DEFAULT NOW());	
	#insert value in user table
	 insert into users (username) values ('Ketan'),('Ankit'),('Vijay');
	# create tweet table
	create table tweets (
	id int auto_increment primary key,
	body text,
	user_id int ,
	created_at TIMESTAMP DEFAULT NOW(),
	foreign key (user_id) references users(id) on delete cascade);
    #insert value in tweet
	insert into tweets (body,user_id) values ('Web-Developer',1),('Java-Developer',2),('Full-Stack Developer',1),('Php Developer',3),('Java-Fx',2);
	# create replies table
	create table replies
	(
	id int auto_increment primary key,
	body text,
	user_id int,
	tweet_id int,
	created_at timestamp default now(),
	foreign key (user_id) references users(id) on delete cascade,
	foreign key(tweet_id) references tweets(id) on delete cascade);
    #create like table
    create table likes
    (
    user_id int,tweet_id int , created_at timestamp default now(),
    foreign key (user_id) references users(id) on delete cascade,
    foreign key (tweet_id) references tweets(id) on delete cascade
    ,primary key(tweet_id,user_id)
    );
    #insert into likes
    insert into likes (user_id,tweet_id)
    values (1,3),(1,1),(2,1),(3,1),(3,2);
    select * from likes;

       # insert reply
	   insert into replies (body,user_id,tweet_id) values ('yes',1,1),('NO',2,1),('Never','3','1');
	   insert into replies (body,user_id,tweet_id) values ('yes',1,2),('NO',3,2),('Never','1','2');

	select * from users;
		# Show the user has tweets
		select users.username,
		tweets.body,
		tweets.created_at
		from tweets join users ON tweets.user_id = users.id;
        # Show the user and his tweets and reply on tweets
		select 
		users.username ,
		tweets.body as tweet,
		replies.body as reply,
		replies.created_at 
		from replies join users on replies.user_id = users.id 
		join tweets on replies.tweet_id = tweets.id ; 
        #show the like on a partucular tweet 
        select  count(likes.tweet_id) as likes,
        tweets.body from likes join tweets on likes.tweet_id = tweets.id group by likes.tweet_id;
drop table if exists users;
		