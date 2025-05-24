### 1. What is PostgreSQL?
PostgreSQL হলো একটি রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS), যা SQL (Structured Query Language) ব্যবহার করে ডাটাবেস ম্যানেজ করে।

### 2. What is the purpose of a database schema in PostgreSQL?
এটি হলো ডাটাবেসের কাঠামো বা স্ট্রাকচার, যেখানে বিভিন্ন টেবিল, ভিউ, ফাংশন, ইত্যাদি সংরক্ষিত থাকে।

### 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
Primary Key হচ্ছে্ এমন একটি কলাম বা একাধিক কলামের সমষ্টি যা টেবিলরে প্রতিটি রের্কড আলাদা আলাদা নির্দেশ করে। এটি কোন ডুপ্লিকেট মান গ্রহন করবে না এবং এটি কোন Null গ্রহন করবে না। Foreign Key বলতে একাধিক টেবিল এর মধ্যে সংযোগ স্থাপন করাকে বুঝায় সহজ ভাষায় হল একাধিক টেবিল এর মধ্যে সংযোগ ব্যবস্থা করাকে বুঝায়।

### 4. What is the difference between the VARCHAR and CHAR data types?
VARCHAR(n): এটি ভ্যারিয়েবল-লেংথ স্ট্রিং। আপনি যতটা লিখবেন, ততটাই স্পেস নেবে। CHAR(n): এটি ফিক্সড-লেংথ স্ট্রিং। সবসময় n ক্যারেক্টার সংরক্ষণ করে।
name VARCHAR(50) -- ৫ ক্যারেক্টার লিখলে ৫ স্পেসই নেবে
code CHAR(50) -- ৫ ক্যারেক্টার লিখলেও ৫০ স্পেস রিজার্ভ থাকবে

### 5. What are the LIMIT and OFFSET clauses used for?
LIMIT: কতগুলো রেকর্ড ফেরত দিতে হবে, তা নির্ধারণ করে। OFFSET: কতগুলো রেকর্ড স্কিপ করতে হবে, তা নির্ধারণ করে।
SELECT * FROM sightings ORDER BY sighting_time DESC LIMIT 5 OFFSET 5;
উপরের কুয়েরি ৬ষ্ঠ থেকে ১০ম রেকর্ড দেখাবে যেহেতু এটির OFFSET 5 (মূলত pagination-এ কাজে দেয়)।
