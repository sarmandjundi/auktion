create database auktion;



CREATE TABLE
  `bid` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `item_id` int unsigned NOT NULL,
    `user_id` int unsigned NOT NULL,
    `price` double(8, 2) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `bid_item_id_foreign` (`item_id`),
    KEY `bid_user_id_foreign` (`user_id`),
    CONSTRAINT `bid_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
    CONSTRAINT `bid_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 15 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci
  

  insert into `bid` (`id`, `item_id`, `price`, `user_id`) values (1, 1, 12344, 1);
  insert into `bid` (`id`, `item_id`, `price`, `user_id`) values (8, 2, 17000, 1);
  insert into `bid` (`id`, `item_id`, `price`, `user_id`) values (9, 3, 300000, 2);
  insert into `bid` (`id`, `item_id`, `price`, `user_id`) values (10, 4, 10000, 1);
  insert into `bid` (`id`, `item_id`, `price`, `user_id`) values (11, 21, 7000, 2);
  insert into `bid` (`id`, `item_id`, `price`, `user_id`) values (12, 19, 500000, 3);
  insert into `bid` (`id`, `item_id`, `price`, `user_id`) values (13, 20, 12000, 3);


  
  
  CREATE TABLE
  `picture` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `url` varchar(255) NOT NULL,
    `item_id` int unsigned NOT NULL,
    PRIMARY KEY (`id`),
    KEY `picture_item_id_foreign` (`item_id`),
    CONSTRAINT `picture_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci


    insert into `picture` (`id`, `item_id`, `url`) values (2, 4, 'https://www.dustin.se/product/5011227422/surface-laptop-4-for-foretag-black');
    insert into `picture` (`id`, `item_id`, `url`) values (3, 3, 'https://autonytt.se/wp-content/uploads/bmw-530e-xdrive-sedan-2021-facelift-5-serie-10.jpg');
    insert into `picture` (`id`, `item_id`, `url`) values (4, 2, 'https://www.elgiganten.se/product/gaming/gaming-pc/stationar-gamingdator/acer-nitro-n50-i5-121610003060ti-stationar-dator-gaming/389755');
    insert into `picture` (`id`, `item_id`, `url`) values (5, 1, 'https://www.elgiganten.se/product/sport-fritid/foto-bild-kamera/kamera/analog-kamera-polaroidkamera/fujifilm-instax-mini-11-kompaktkamera-bla-10-pack-utskriftspapper/298955');
    insert into `picture` (`id`, `item_id`, `url`) values (6, 19, 'https://www.audi.se/se/web/sv/models/e-tron-gt/audi-e-tron-gt.html');
    insert into `picture` (`id`, `item_id`, `url`) values (7, 20, 'https://www.chilli.se/m%C3%B6bler/soffor/sammetssoffa/u-soffa-haga-sammet-gr%C3%A5-p1697384-v295857');
    insert into `picture` (`id`, `item_id`, `url`) values (8, 21, 'https://www.gear4music.com/Guitar-and-Bass/Junior-1-2-Classical-Guitar-Natural-by-Gear4music/OZU?_gl=1*1osat7c*_ga*MTY4NDk5MDE5NS4xNjcwNzYyMTIx*_up*MQ..');

  
  
  
  
  CREATE TABLE
  `item` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `title` varchar(255) NOT NULL,
    `description` varchar(255) NOT NULL,
    `start_time` timestamp NOT NULL,
    `end_time` timestamp NOT NULL,
    PRIMARY KEY (`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 29 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci


  insert into `item` (`description`, `end_time`, `id`, `start_time`, `title`) values (' kompaktkamera l??ter dig f??nga de h??rligaste ??gonblicken i ditt liv med ett enkelt knapptryck. Tack vare de smarta funktionerna och breda fokusf??lt ??r tid och rum inga problem.', '2022-12-20 00:00:00', 1, '2022-12-07 00:00:00', 'Fujifilm');
  insert into `item` (`description`, `end_time`, `id`, `start_time`, `title`) values (' station??r gamingdator som med kraftfulla komponenter ser till att du kan uppleva dina favoritspel i h??g uppl??sning. ', '2022-12-28 00:00:00', 2, '2022-12-19 00:00:00', 'gamingdator');
  insert into `item` (`description`, `end_time`, `id`, `start_time`, `title`) values ('??r ni p?? jakt efter en riktigt h??rlig kombi med en stark motor? D?? kollar ni definitivt p?? r??tt bil. Vi p?? RCD BIL har precis f??tt in v??ldigt fin BMW 530 d i en m??rkbl?? metallic exteri??r med 258 starka dieselh??star. ', '2022-12-12 00:00:00', 3, '2022-12-08 00:00:00', 'BMW 530 d xDrive');
  insert into `item` (`description`, `end_time`, `id`, `start_time`, `title`) values ('its very beautiful laptop from germany, i got it from my father', '2022-12-05 00:00:00', 4, '2022-12-01 00:00:00', 'laptop');
  insert into `item` (`description`, `end_time`, `id`, `start_time`, `title`) values ('en eldriven audi som har 600 h??star , bra i motorn och billig i skatt. ', '2022-12-10 15:00:00', 19, '2022-12-09 15:02:09', 'audi e-tron');
  insert into `item` (`description`, `end_time`, `id`, `start_time`, `title`) values ('Hitta r??tt soffa f??r ditt hem. Soffor till bra pris och h??g kvalitet! 10 ??rs garanti', '2022-12-15 17:30:00', 20, '2022-12-13 16:05:00', 'soffa');
  insert into `item` (`description`, `end_time`, `id`, `start_time`, `title`) values ('en musik instrument som m??nga tycker om att spela och ganska k??nd bland alla musiker.', '2022-12-24 14:11:00', 21, '2022-12-11 13:31:00', 'gitarr');
  insert into `item` (`description`, `end_time`, `id`, `start_time`, `title`) values ('its very beautiful laptop from germany, i got it from my father', '2022-12-05 00:00:00', 22, '2022-12-01 00:00:00', 'laptop');
  insert into `item` (`description`, `end_time`, `id`, `start_time`, `title`) values ('its very beautiful laptop from germany, i got it from my father', '2022-12-05 00:00:00', 23, '2022-12-01 00:00:00', 'laptop');
  insert into `item` (`description`, `end_time`, `id`, `start_time`, `title`) values ('its very beautiful laptop from germany, i got it from my father', '2022-12-05 00:00:00', 24, '2022-12-01 00:00:00', 'laptop');
  insert into `item` (`description`, `end_time`, `id`, `start_time`, `title`) values ('its very beautiful laptop from germany, i got it from my father', '2022-12-05 00:00:00', 25, '2022-12-01 00:00:00', 'laptop');
  insert into `item` (`description`, `end_time`, `id`, `start_time`, `title`) values ('its very beautiful laptop from germany, i got it from my father', '2022-12-05 00:00:00', 26, '2022-12-01 00:00:00', 'laptop');
  insert into `item` (`description`, `end_time`, `id`, `start_time`, `title`) values ('its very beautiful laptop from germany, i got it from my father', '2022-12-05 00:00:00', 27, '2022-12-01 00:00:00', 'laptop');
  insert into `item` (`description`, `end_time`, `id`, `start_time`, `title`) values ('j??tte fin och stark h??st', '2022-12-13 21:45:09', 28, '2022-12-12 20:44:09', 'h??st');





CREATE TABLE
  `user` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `firstname` varchar(255) NOT NULL,
    `lastname` varchar(255) NOT NULL,
    `email` varchar(255) NOT NULL,
    `password` varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 26 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci


  insert into `user` (`email`, `firstname`, `id`, `lastname`, `password`) values ('hai.hai@hotmail.com', 'juan', 1, 'batman', '123abc');
  insert into `user` (`email`, `firstname`, `id`, `lastname`, `password`) values ('emma.dahl@hotmail.com', 'emma', 2, 'dahl', '345t');
  insert into `user` (`email`, `firstname`, `id`, `lastname`, `password`) values ('erik.adams@gmail.com', 'erik', 3, 'adams', '5678h');
  insert into `user` (`email`, `firstname`, `id`, `lastname`, `password`) values ('hai.hai@hotmail.com', 'juan', 20, 'batman', '123abc');
  insert into `user` (`email`, `firstname`, `id`, `lastname`, `password`) values ('hai.hai@hotmail.com', 'juan', 21, 'batman', '123abc');
  insert into `user` (`email`, `firstname`, `id`, `lastname`, `password`) values ('hai.hai@hotmail.com', 'juan', 22, 'batman', '123abc');
  insert into `user` (`email`, `firstname`, `id`, `lastname`, `password`) values ('hai.hai@hotmail.com', 'juan', 23, 'batman', '123abc');
  insert into `user` (`email`, `firstname`, `id`, `lastname`, `password`) values ('hai.hai@hotmail.com', 'juan', 24, 'batman', '123abc');
  insert into `user` (`email`, `firstname`, `id`, `lastname`, `password`) values ('ram.jundi@hotmail.com', 'ram', 25, 'jundi', '123ghj');
