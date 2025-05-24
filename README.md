### 1. What is PostgreSQL?
PostgreSQL হলো একটি রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS), যা SQL (Structured Query Language) ব্যবহার করে ডাটাবেস ম্যানেজ করে। এটি Open Source এবং High Performance ডাটাবেস, যা ছোট থেকে বড় লেভেলের অ্যাপ্লিকেশন তৈরি করতে ব্যবহৃত হয়। তাছাড়া এটি ফ্রি এবং ওপেন সোর্স এবং MySQL-এর মতো, কিন্তু আরও বেশি ফিচার সমৃদ্ধ। এটি Data integrity বজায় রাখে (Atomicity, Consistency, Isolation, Durability) এবং নতুন ফাংশন, টাইপ, স্টোরড প্রসিডিওর যোগ করা যায়। লার্জ স্কেলে ডাটা হ্যান্ডেল করতে পারে, এবং অ্যাডভান্সড সিকিউরিটি সাপোর্ট দেয়।

### 2. What is the purpose of a database schema in PostgreSQL?
এটি হলো ডাটাবেসের কাঠামো বা স্ট্রাকচার, যেখানে বিভিন্ন টেবিল, ভিউ, ফাংশন, ইত্যাদি সংরক্ষিত থাকে। এর মাধ্যমে ডেটা সংগঠন সহজ হয় এবং ভিন্ন ব্যবহারকারীর মধ্যে পার্টিশন করা যায়। তাছাড়া একই নামের টেবিল আলাদা স্কিমায় রাখা যায় যা খুব সহজবোধ্য।

### 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
Primary Key হচ্ছে্ এমন একটি কলাম বা একাধিক কলামের সমষ্টি যা টেবিলরে প্রতিটি রের্কড আলাদা আলাদা নির্দেশ করে। এটি কোন ডুপ্লিকেট মান গ্রহন করবে না এবং এটি কোন Null গ্রহন করবে না। Foreign Key বলতে একাধিক টেবিল এর মধ্যে সংযোগ স্থাপন করাকে বুঝায় সহজ ভাষায় হল একাধিক টেবিল এর মধ্যে সংযোগ ব্যবস্থা করাকে বুঝায়।
CREATE TABLE rangers (
  ranger_id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE sightings (
  sighting_id SERIAL,
  ranger_id INT REFERENCES rangers(ranger_id)
);

### 4. What is the difference between the VARCHAR and CHAR data types?
VARCHAR(n): এটি ভ্যারিয়েবল-লেংথ স্ট্রিং। আপনি যতটা লিখবেন, ততটাই স্পেস নেবে। CHAR(n): এটি ফিক্সড-লেংথ স্ট্রিং। সবসময় n ক্যারেক্টার সংরক্ষণ করে।
name VARCHAR(50) -- ৫ ক্যারেক্টার লিখলে ৫ স্পেসই নেবে
code CHAR(50) -- ৫ ক্যারেক্টার লিখলেও ৫০ স্পেস রিজার্ভ থাকবে

### 5. What are the LIMIT and OFFSET clauses used for?
LIMIT: কতগুলো রেকর্ড ফেরত দিতে হবে, তা নির্ধারণ করে। OFFSET: কতগুলো রেকর্ড স্কিপ করতে হবে, তা নির্ধারণ করে।
SELECT * FROM sightings ORDER BY sighting_time DESC LIMIT 5 OFFSET 5;
উপরের কুয়েরি ৬ষ্ঠ থেকে ১০ম রেকর্ড দেখাবে যেহেতু এটির OFFSET 5 (মূলত pagination-এ কাজে দেয়)।
