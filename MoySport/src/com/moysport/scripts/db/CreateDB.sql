SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

SHOW WARNINGS;

DROP SCHEMA IF EXISTS `mysport`;
CREATE SCHEMA IF NOT EXISTS `mysport` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `mysport` ;

-- -----------------------------------------------------
-- Table `USERS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `USERS` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `USERS` (
  `IDUSER` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID пользователя, уникальный ключ, идентификатор пользователя.\nАвтоматично генерується системою при додаванні користувача, закрите для редагування та відображення \nTable Description: В таблиці USER зберігаються всі облікові картки користувачів. На кожного користувача створюється окрема облікова картка. ',
  `ISBOT` INT(11) NULL DEFAULT NULL COMMENT 'Ідентифікатор належності даного облікового запису до типу БОТ \nАвтоматично проставляється системою у випадку створення активним користувачем іншого користувача. Закрите для редагування, відображається на інтерфейсі. ',
  `IDCREATEDBY` INT(11) NULL DEFAULT NULL COMMENT 'ID користувача, яким було створено даного користувача\nАвтоматично проставляється системою у випадку створення активним користувачем іншого користувача. Закрите для редагування та відображення.',
  `NICKNAME` VARCHAR(60) NULL COMMENT 'Псевдонім. Унікальне ім’я яке вводить сам користувач при реєстрації або редагуванні свого профілю \nДоступне для редагування. Повинно бути унікальним та обов’язково заповненим користувачем, проте в БД може бути пустим',
  `FIRSTNAME` VARCHAR(60) NULL DEFAULT NULL COMMENT 'Ім’я\nДоступне для редагування. ',
  `LASTNAME` VARCHAR(60) NULL DEFAULT NULL COMMENT 'Прізвище\nДоступне для редагування. ',
  `MIDDLENAME` VARCHAR(60) NULL DEFAULT NULL COMMENT 'По-батькові\nДоступне для редагування.',
  `MPHONE` VARCHAR(15) NULL DEFAULT NULL COMMENT 'Номер контактного телефону\nДоступне для редагування.',
  `EMAIL` VARCHAR(100) NULL COMMENT 'e-mail\nДоступне для редагування. Повинно бути обов’язково заповненим користувачем',
  `ISEMAILVERIFIED` INT(11) NULL DEFAULT NULL COMMENT 'Ознака чи e-mail є валідним\nАвтоматично встановлюється системою при підтвердженні поштової адреси',
  `SOCIALNETWORKLOGIN` VARCHAR(100) NULL DEFAULT NULL COMMENT 'Логін в вибраний тип соціальної мережі\nДоступне для редагування. ',
  `SOCIALNETWORKTYPE` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Тип соціальної мережі (необхідно створити таблицю з каталогом)\nДоступне для редагування. ',
  `BIRTHDATE` DATETIME NULL DEFAULT NULL COMMENT 'Дата народження\nДоступне для редагування. ',
  `PERFMARK` DECIMAL(8,2) NULL DEFAULT NULL COMMENT 'Оцінка успішності\nАвтоматично генерується системою. Закрите для редагування. Відображається на інтерфейсі',
  `REPMARK` DECIMAL(8,2) NULL DEFAULT NULL COMMENT 'Оцінка репутації\nАвтоматично генерується системою. Закрите для редагування. Відображається на інтерфейсі',
  `POSITIVEREP` INT(11) NULL DEFAULT NULL COMMENT 'Бали позитивної репутації\nАвтоматично генерується системою. Закрите для редагування та відображення',
  `NEGATIVEREP` INT(11) NULL DEFAULT NULL COMMENT 'Бали негативної репутації\nАвтоматично генерується системою. Закрите для редагування та відображення',
  `STATUS` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Статус облікової картки\nВстановлюється автоматично при видаленні або блокуванні користувача. Закрите для редагування.',
  `LOCALE` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Мова інтерфейсу\nДоступне для редагування. ',
  `GMT` VARCHAR(8) NULL DEFAULT NULL COMMENT 'Часовий пояс в форматі (-n…n)\nДоступне для редагування. ',
  `PWD` VARCHAR(64) NULL DEFAULT NULL COMMENT 'Пароль користувача\nДоступне для редагування через окрему форму зміни пароля. На інтерфейсі не відображається. Обовязковий атрибут користувача.',
  `CREATIONDATE` DATETIME NULL DEFAULT NULL COMMENT 'Дата створення облікового запису',
  `CHANGEDATE` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Остання дата зміни облікового запису',
  `IDCHANGEBY` INT(11) NULL DEFAULT NULL COMMENT 'ID користувача який змінив дані користувача\nАвтоматично проставляється системою\n',
  PRIMARY KEY (`IDUSER`))
ENGINE = InnoDB 
DEFAULT CHARACTER SET = utf8 COLLATE utf8_general_ci;
SHOW WARNINGS;
CREATE UNIQUE INDEX `NICKNAME_UNIQUE` ON `USERS` (`NICKNAME` ASC);

SHOW WARNINGS;
CREATE UNIQUE INDEX `EMAIL_UNIQUE` ON `USERS` (`EMAIL` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `LOCATIONS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LOCATIONS` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `LOCATIONS` (
  `IDLOCATION` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Локации, уникальный идентификатор локации\nTable Description: Таблица LOCATIONS содержит данные про локации: адрес, географические координаты, кол-во посещений, контакты. Учавствует при создании любого мероприятия.',
  `NAME` VARCHAR(60) NULL COMMENT 'Имя локации',
  `COUNTRY` VARCHAR(60) NULL DEFAULT NULL COMMENT 'Страна локации',
  `REGION` VARCHAR(60) NULL DEFAULT NULL COMMENT 'Область локации',
  `CITY` VARCHAR(60) NULL DEFAULT NULL COMMENT 'Город локации',
  `DISTRICT` VARCHAR(60) NULL DEFAULT NULL COMMENT 'Район города локации',
  `STREET` VARCHAR(60) NULL DEFAULT NULL COMMENT 'Улица локации',
  `BUILDING` VARCHAR(60) NULL DEFAULT NULL COMMENT 'Номер Дома',
  `ZIP` VARCHAR(60) NULL DEFAULT NULL COMMENT 'Почтовый индекс локации',
  `DESCRIPTION` VARCHAR(1000) NULL DEFAULT NULL COMMENT 'Текстовое описание локации',
  `CONTACTS` VARCHAR(60) NULL DEFAULT NULL COMMENT 'имя, номер телефона владельца локации',
  `HTTPLINK` VARCHAR(512) NULL DEFAULT NULL COMMENT 'ссылка на сайт локации',
  `STATUS` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Статус локации (серая, белая)',
  `CHECKIN` INT(11) NULL DEFAULT NULL COMMENT 'Количество проведенных мероприятий на данной локации',
  `IDCREATEDBY` INT(11) NULL DEFAULT NULL COMMENT 'ID создателя локации',
  `CREATIONDATE` DATETIME NULL DEFAULT NULL COMMENT 'Дата и время создания локации',
  `CHANGEDATE` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время последнего обновления локации',
  `IDCHANGEBY` INT(11) NULL DEFAULT NULL COMMENT 'ID пользователя, который совершил последнее изменение локации',
  `TAG` VARCHAR(100) NULL DEFAULT NULL COMMENT 'Тег к локации: виды спорта и пр.',
  `LATITUDE` VARCHAR(20) NULL DEFAULT NULL COMMENT 'Географическая Широта',
  `LONGTITUDE` VARCHAR(20) NULL DEFAULT NULL COMMENT 'Географическая долгота',
  `PIC` VARCHAR(60) NULL DEFAULT NULL COMMENT 'Ссылка на фото',
  PRIMARY KEY (`IDLOCATION`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8 COLLATE utf8_general_ci;

SHOW WARNINGS;
CREATE INDEX `IDCREATEDBY_idx` ON `LOCATIONS` (`IDCREATEDBY` ASC);

SHOW WARNINGS;
CREATE UNIQUE INDEX `NAME_UNIQUE` ON `LOCATIONS` (`NAME` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `SPORTS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SPORTS` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `SPORTS` (
  `IDSPORT` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Унікальний ключ.\nАвтоматично генерується системою при додаванні нового запису, закрите для редагування та відображення\nTable Description: таблиця  SPORTS призначена для зберігання можливих видів спорту (Довідник видів спорту).',
  `NAME` VARCHAR(100) NULL COMMENT 'Назва виду спорта\nНе доступна для редагування, доступна для відображення',
  `RULES` VARCHAR(2000) NULL DEFAULT NULL COMMENT 'Правила\nНе доступна для редагування, доступна для відображення',
  `HTTPLINK` VARCHAR(512) NULL DEFAULT NULL COMMENT 'Посилання на сторінку з інформацією\nНе доступна для редагування, доступна для відображення',
  PRIMARY KEY (`IDSPORT`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8 COLLATE utf8_general_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `EVENTS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EVENTS` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `EVENTS` (
  `IDEVENT` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID мероприятия\nTable Description: Таблица Events является шаблоном для создания мероприятия. Из шаблона наследуется в EventGames атрибуты: idevent,idlocation,name,idsport\nПроблема: как наследовать mark,markcnt - это атрибут игры или ивента?!',
  `NAME` VARCHAR(255) NULL COMMENT 'название события',
  `IDLOCATION` INT(11) NULL DEFAULT NULL COMMENT 'ID локации',
  `IDCREATEDBY` INT(11) NULL DEFAULT NULL COMMENT 'ID создателя мероприятия',
  `IDCHANGEBY` INT(11) NULL DEFAULT NULL COMMENT 'ID пользователя изменившего мероприятие\n',
  `CHANGEDATE` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время последнего обновления мероприятия',
  `MARK` INT(11) NULL DEFAULT NULL COMMENT 'оценка мероприяти',
  `MARKCNT` INT(11) NULL DEFAULT NULL COMMENT 'количество оценок',
  `IDSPORT` INT(11) NULL DEFAULT NULL COMMENT 'ID вида спорта',
  PRIMARY KEY (`IDEVENT`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8 COLLATE utf8_general_ci;

SHOW WARNINGS;
CREATE UNIQUE INDEX `NAME_UNIQUE` ON `EVENTS` (`NAME` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `EVENTGAMES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EVENTGAMES` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `EVENTGAMES` (
  `IDGAME` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID события/игры\nTable Description: таблица EVENTGAMES является подчиненной таблицей к таблице EVENTS. Необходимо для проведения многих игр на одной локации ',
  `IDEVENT` INT(11) NULL COMMENT 'ID события(внешний ключ к EVENTS)',
  `STARTTIME` DATETIME NULL COMMENT 'Время начала события',
  `ENDTIME` DATETIME NULL COMMENT 'Время окончания события',
  `COMMENTS` VARCHAR(500) NULL DEFAULT NULL COMMENT 'Комментарий к событию',
  PRIMARY KEY (`IDGAME`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8 COLLATE utf8_general_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `GAMEPARTIES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GAMEPARTIES` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `GAMEPARTIES` (
  `IDGP` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID GameParty.\nTable Description: таблица в которой учасники оценивают игру, проставляется признак того был ли пользователь на игре',
  `IDGAME` INT(11) NULL COMMENT 'ID игры/мероприятия\n',
  `IDUSER` INT(11) NULL COMMENT 'ID участника игры',
  `VISITED` INT(11) NULL COMMENT 'флаг посещения',
  `MARK` INT(11) NULL DEFAULT NULL COMMENT 'оценка',
  `IDTEAM` INT(11) NULL DEFAULT NULL COMMENT 'номер команды на мероприятии',
  PRIMARY KEY (`IDGP`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8 COLLATE utf8_general_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `GAMERATINGS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GAMERATINGS` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `GAMERATINGS` (
  `IDGR` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID (primary key)\nTable Description: Таблица GAMERATINGS содержит оценки сделанные игроками друг другу, за определенную игру. Связана с EventGames по IDGAME.',
  `IDGAME` INT(11) NULL COMMENT 'ID игры/события',
  `IDRANKEDPLAYER` INT(11) NULL DEFAULT NULL COMMENT 'Id оцениваемого игрока',
  `IDESTIMATEPLAYER` INT(11) NULL DEFAULT NULL COMMENT 'Id игрока который оценивает',
  `ESTIMATEDATE` DATETIME NULL DEFAULT NULL COMMENT 'дата оценки',
  `ESTIMATECOMMENT` VARCHAR(500) NULL COMMENT 'комментарий игрока который оценивает',
  PRIMARY KEY (`IDGR`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8 COLLATE utf8_general_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `TRAININGPLAN`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TRAININGPLAN` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `TRAININGPLAN` (
  `IDTP` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Унікальний ключ, головний ідентифікатор плану тренувань.\nАвтоматично генерується системою\nTable Description:  План тренувань. Створюється користувачем на певний вид спорту.',
  `IDCREATEDBY` INT(11) NULL DEFAULT NULL COMMENT 'ID користувача який створив план тренувань\nАвтоматично проставляється системою\n',
  `CREATIONDATE` DATETIME NULL DEFAULT NULL COMMENT 'Дата створення плану тренувань\nАвтоматично проставляється системою\n',
  `NAMETP` VARCHAR(60) NULL DEFAULT NULL COMMENT 'Назва плану тренувань\nПроставляється користувачем\n',
  `DESCRIPTION` VARCHAR(1000) NULL DEFAULT NULL COMMENT 'Опис (додаткова інформація)\nПроставляється користувачем\n',
  `IDSPORT` INT(11) NULL DEFAULT NULL COMMENT 'ID виду спорту\nПроставляється користувачем\n',
  `TARGET` INT(11) NULL DEFAULT NULL COMMENT 'Ціль, кількість запланованих тренувань\nПроставляється користувачем\n',
  `IDLOCATION` INT(11) NULL DEFAULT NULL COMMENT 'ID локации. Місце проведення тренувань(Locations)\nПроставляється користувачем\n',
  `DOW1` INT(11) NULL DEFAULT NULL COMMENT 'День тижня ПН, в котрому планується проводити тренування (true/false) за замовченням false\nПроставляється користувачем',
  `DOW2` INT(11) NULL DEFAULT NULL COMMENT 'День тижня ВТ, в котрому планується проводити тренування (true/false) за замовченням false\nПроставляється користувачем',
  `DOW3` INT(11) NULL DEFAULT NULL COMMENT 'День тижня СР, в котрому планується проводити тренування (true/false) за замовченням false\nПроставляється користувачем\n',
  `DOW4` INT(11) NULL DEFAULT NULL COMMENT 'День тижня ЧТ, в котрому планується проводити тренування (true/false) за замовченням false\nПроставляється користувачем',
  `DOW5` INT(11) NULL DEFAULT NULL COMMENT 'День тижня ПТ, в котрому планується проводити тренування (true/false) за замовченням false\nПроставляється користувачем',
  `DOW6` INT(11) NULL DEFAULT NULL COMMENT 'День тижня СБ, в котрому планується проводити тренування (true/false) за замовченням false\nПроставляється користувачем\n',
  `DOW7` INT(11) NULL DEFAULT NULL COMMENT 'День тижня НД, в котрому планується проводити тренування (true/false) за замовченням false. Проставляється користувачем\n',
  `ISPAUSE` INT(11) NULL DEFAULT NULL COMMENT 'Стан плану тренувань(true/false) за замовченням false\nПроставляється користувачем',
  `IMPORTEVENTS` INT(11) NULL DEFAULT NULL COMMENT 'Чи необхідно автоматично створювати Тренування на основі подій котрі підходять під критерії (true/false) за замовченням false\nПроставляється користувачем',
  `COPYDATA` INT(11) NULL DEFAULT NULL COMMENT 'Чи необхідно копіювати дані при створенні нового Тижня тренувань(true/false) за замовченням true\nПроставляється користувачем',
  `RATING` INT(11) NULL DEFAULT NULL COMMENT 'Розрахункове поле у відсотках, котре відображає сумарну успішність по всім тижням тренувань\nАвтоматично проставляється системою',
  `RATINGDATE` DATETIME NULL DEFAULT NULL COMMENT 'Дата оновлення рейтингу\nАвтоматично проставляється системою',
  `IDCHANGEBY` INT(11) NULL DEFAULT NULL COMMENT 'ID користувача який змінив план тренувань\nАвтоматично проставляється системою\n',
  `CHANGEDATE` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Остання дата зміни плану тренувань\nАвтоматично проставляється системою\n',
  PRIMARY KEY (`IDTP`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8 COLLATE utf8_general_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `TRAININGWEEK`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TRAININGWEEK` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `TRAININGWEEK` (
  `IDTW` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID унікальний ключ, головний ідентифікатор тижня тренувань.\nАвтоматично проставляється системою.\nTable Description: таблиця тижні тренувань. Генеруються системою автоматично, на кожну неділю окремо,  на основі даних з «Плану тренувань», з подальшою змогою редагування даних користувачем.',
  `IDTP` INT(11) NULL DEFAULT NULL COMMENT 'Ключ плану тренувань (TrainingPlan) \nАвтоматично проставляється системою',
  `IDCREATEDBY` INT(11) NULL DEFAULT NULL COMMENT 'Ключ користувача який створив тиждень тренувань\nАвтоматично проставляється системою',
  `CREATIONDATE` DATETIME NULL DEFAULT NULL COMMENT 'Дата створення тижня тренувань\nАвтоматично проставляється системою',
  `WEEKNUM` INT(11) NULL DEFAULT NULL COMMENT 'Номер тижня в році\nАвтоматично проставляється системою',
  `WEEKDBEGIN` DATETIME NULL DEFAULT NULL COMMENT 'Дата початку тижня (ПН)\nАвтоматично проставляється системою',
  `WEEKDEND` DATETIME NULL DEFAULT NULL COMMENT 'Дата закінчення тижня(НД)\nАвтоматично проставляється системою',
  `TARGET` INT(11) NULL DEFAULT NULL COMMENT 'Ціль, кількість запланованих тренувань на тижні\nАвтоматично копіюється з Плану тренувань при створенні, з можливістю редагування ',
  `IDLOCATION` INT(11) NULL DEFAULT NULL COMMENT 'Місце проведення тренувань(Locations)\nАвтоматично копіюється з Плану тренувань при створенні, з можливістю редагування\n',
  `DOW1` INT(11) NULL DEFAULT NULL COMMENT 'Значення true/false – відображає чи планується тренування в  цей день\nАвтоматично копіюється з Плану тренувань при створенні, з можливістю редагування',
  `DOW2` INT(11) NULL DEFAULT NULL COMMENT 'Значення true/false – відображає чи планується тренування в  цей день\nАвтоматично копіюється з Плану тренувань при створенні, з можливістю редагування',
  `DOW3` INT(11) NULL DEFAULT NULL COMMENT 'Значення true/false – відображає чи планується тренування в  цей день\nАвтоматично копіюється з Плану тренувань при створенні, з можливістю редагування\n',
  `DOW4` INT(11) NULL DEFAULT NULL COMMENT 'Значення true/false – відображає чи планується тренування в  цей день\nАвтоматично копіюється з Плану тренувань при створенні, з можливістю редагування',
  `DOW5` INT(11) NULL DEFAULT NULL COMMENT 'Значення true/false – відображає чи планується тренування в  цей день\nАвтоматично копіюється з Плану тренувань при створенні, з можливістю редагування',
  `DOW6` INT(11) NULL DEFAULT NULL COMMENT 'Значення true/false – відображає чи планується тренування в  цей день\nАвтоматично копіюється з Плану тренувань при створенні, з можливістю редагування',
  `DOW7` INT(11) NULL DEFAULT NULL COMMENT 'Значення true/false – відображає чи планується тренування в  цей день\nАвтоматично копіюється з Плану тренувань при створенні, з можливістю редагування',
  `ISPAUSE` INT(11) NULL DEFAULT NULL COMMENT 'Значення true/false – котре необхідне при розрахунку успішності\nАвтоматично копіюється з Плану тренувань при створенні, з можливістю редагування',
  `IDCHANGEBY` INT(11) NULL DEFAULT NULL COMMENT 'Ключ користувача, котрий останній змінював дані \nАвтоматично проставляється системою',
  `CHANGEDATE` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата редагування\nАвтоматично проставляється системою',
  PRIMARY KEY (`IDTW`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8 COLLATE utf8_general_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `TRAININGS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TRAININGS` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `TRAININGS` (
  `IDT` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID ідентифікатор тренувань\nTable Description: Таблиця тренування. Створюються користувачем або автоматично системою (якщо відповідні події були знайдені з участю користувача в плані тренувань і проставлена відмітка про бажання автоматичного створення тренувань на основі подій). На один день можливо декілька тренувань. ',
  `DESCRIPTION` VARCHAR(1000) NULL COMMENT 'Коментарі користувача\nПроставляється користувачем',
  `IDTW` INT(11) NULL DEFAULT NULL COMMENT 'ID тижня тренувань (TrainingWeek)\nАвтоматично проставляється системою',
  `IDTP` INT(11) NULL DEFAULT NULL COMMENT 'ID плану тренувань (TrainingPlan)\nАвтоматично проставляється системою\n',
  `IDCREATEDBY` INT(11) NULL DEFAULT NULL COMMENT 'ID користувача який створив тренування\nАвтоматично проставляється системою',
  `CREATIONDATE` DATETIME NULL DEFAULT NULL COMMENT 'Дата створення тренування\nАвтоматично проставляється системою',
  `TRAINSDATE` DATETIME NULL DEFAULT NULL COMMENT 'Дата проведення тренування',
  `TRAINSNUM` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Кількість проведених тренувань',
  `IDLOCATION` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Місце проведення тренувань(Locations)\nАвтоматично копіюється з тижня тренувань при створенні, з можливістю редагування',
  `IDPARTY` INT(11) NULL DEFAULT NULL COMMENT 'Ключ події (EventParty)\nАвтоматично проставляється системою якщо тренування створено системою або  користувач вводить сам. Поле не є обов’язковим.',
  `ADDITIONALINFO` INT(11) NULL DEFAULT NULL COMMENT 'Ключ на додаткові дані, зроблено про запас\n',
  `IDCHANGEBY` INT(11) NULL DEFAULT NULL COMMENT 'Ключ користувача, котрий останній змінював дані \nАвтоматично проставляється системою',
  `CHANGEDATE` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата редагування\nАвтоматично проставляється системою',
  PRIMARY KEY (`IDT`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8 COLLATE utf8_general_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `USERSKILL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `USERSKILL` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `USERSKILL` (
  `ID` INT NOT NULL AUTO_INCREMENT COMMENT 'Унікальний ключ\nАвтоматично генерується системою при додаванні нового запису, закрите для редагування та відображення\nTable Description: таблиця  USERSKILL організує зв’язок між таблицями USER та USRSPORTS. В цій таблиці зберігаються досягнення користувача по окремому виду спорта.  ',
  `IDUSER` INT(11) NULL COMMENT 'Ключ для зв’язку з таблицею USER\nАвтоматично генерується системою при додаванні нового запису, закрите для редагування та відображення',
  `IDSPORT` INT(11) NULL COMMENT 'Ключ для зв’язку з таблицею SPORTS\nАвтоматично встановлюється системою при виборі користувачем значення із випадаючого списку з видами спорту. Доступне для редагування лише при додаванні виду спорту. Доступне для відображення',
  `ACTCNT` INT(11) NULL DEFAULT NULL COMMENT 'Відображає скільки разів користувач приймав участь у даному виді спорта\nАвтоматично генерується системою. Доступне для відображення',
  `LASTACTDATE` DATETIME NULL DEFAULT NULL COMMENT 'Дата останньої події\nАвтоматично генерується системою. Доступне для відображення',
  `ACTRATING` DECIMAL(8,2) NULL DEFAULT NULL COMMENT 'Оцінка майстерності\n',
  `ACTRATINGCNT` INT(11) NULL DEFAULT NULL COMMENT 'Кількість оцінювань\nАвтоматично генерується системою по завершенню спортивної події. Початкове значення=1. Не доступне для відображення.',
  `PERFMARK` DECIMAL(8,2) NULL DEFAULT NULL COMMENT 'Оцінка успішності\nАвтоматично генерується системою. Доступне для відображення.',
  `SELFRATING` INT(11) NULL DEFAULT NULL COMMENT 'Особиста оцінка майстерності\nДоступна для редагування та відображення.',
  `CHANGEDATE` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Остання дата зміни',
  `IDCHANGEBY` INT(11) NULL DEFAULT NULL COMMENT 'Ключ користувача який змінив дані користувача\nАвтоматично проставляється системою\n',
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8 COLLATE utf8_general_ci;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- Query: SELECT * FROM mysport.eventgames
INSERT INTO `eventgames` (`IDGAME`,`IDEVENT`,`STARTTIME`,`ENDTIME`,`COMMENTS`) VALUES (1,1,'2012-04-13 06:02:00','2012-04-15 12:02:00','ивет был зачетный');
INSERT INTO `eventgames` (`IDGAME`,`IDEVENT`,`STARTTIME`,`ENDTIME`,`COMMENTS`) VALUES (2,2,'2012-04-13 06:02:00','2012-04-15 12:02:00','Слив');
INSERT INTO `eventgames` (`IDGAME`,`IDEVENT`,`STARTTIME`,`ENDTIME`,`COMMENTS`) VALUES (3,3,'2012-04-13 06:02:00','2012-04-15 12:02:00','Нубы');
INSERT INTO `eventgames` (`IDGAME`,`IDEVENT`,`STARTTIME`,`ENDTIME`,`COMMENTS`) VALUES (4,1,'2012-04-13 06:02:00','2012-04-15 12:02:00','Игра прошла успешно');

-- Query: SELECT * FROM mysport.events
INSERT INTO `events` (`IDEVENT`,`NAME`,`IDLOCATION`,`IDCREATEDBY`,`IDCHANGEBY`,`CHANGEDATE`,`MARK`,`MARKCNT`,`IDSPORT`) VALUES (1,'Название ивента1',1,1,1,'2013-04-13 06:12:00',4,4,1);
INSERT INTO `events` (`IDEVENT`,`NAME`,`IDLOCATION`,`IDCREATEDBY`,`IDCHANGEBY`,`CHANGEDATE`,`MARK`,`MARKCNT`,`IDSPORT`) VALUES (2,'Название ивента2',1,1,1,'2013-04-14 07:12:00',4,4,1);
INSERT INTO `events` (`IDEVENT`,`NAME`,`IDLOCATION`,`IDCREATEDBY`,`IDCHANGEBY`,`CHANGEDATE`,`MARK`,`MARKCNT`,`IDSPORT`) VALUES (3,'Название ивента3',1,1,1,'2013-04-15 08:12:00',4,4,1);
INSERT INTO `events` (`IDEVENT`,`NAME`,`IDLOCATION`,`IDCREATEDBY`,`IDCHANGEBY`,`CHANGEDATE`,`MARK`,`MARKCNT`,`IDSPORT`) VALUES (4,'Название ивента4',1,1,1,'2013-07-16 09:12:00',4,4,1);
INSERT INTO `events` (`IDEVENT`,`NAME`,`IDLOCATION`,`IDCREATEDBY`,`IDCHANGEBY`,`CHANGEDATE`,`MARK`,`MARKCNT`,`IDSPORT`) VALUES (5,'Название ивента5',1,1,1,'2013-07-17 10:12:00',4,4,1);
INSERT INTO `events` (`IDEVENT`,`NAME`,`IDLOCATION`,`IDCREATEDBY`,`IDCHANGEBY`,`CHANGEDATE`,`MARK`,`MARKCNT`,`IDSPORT`) VALUES (6,'Название ивента6',1,1,1,'2013-04-13 06:14:00',4,4,1);
INSERT INTO `events` (`IDEVENT`,`NAME`,`IDLOCATION`,`IDCREATEDBY`,`IDCHANGEBY`,`CHANGEDATE`,`MARK`,`MARKCNT`,`IDSPORT`) VALUES (7,'Название ивента7',1,1,1,'2013-06-14 07:34:00',4,4,1);
INSERT INTO `events` (`IDEVENT`,`NAME`,`IDLOCATION`,`IDCREATEDBY`,`IDCHANGEBY`,`CHANGEDATE`,`MARK`,`MARKCNT`,`IDSPORT`) VALUES (8,'Название ивента8',1,1,1,'2013-06-15 08:23:00',4,4,1);
INSERT INTO `events` (`IDEVENT`,`NAME`,`IDLOCATION`,`IDCREATEDBY`,`IDCHANGEBY`,`CHANGEDATE`,`MARK`,`MARKCNT`,`IDSPORT`) VALUES (9,'Название ивента9',1,1,1,'2013-06-16 09:24:00',4,4,1);
INSERT INTO `events` (`IDEVENT`,`NAME`,`IDLOCATION`,`IDCREATEDBY`,`IDCHANGEBY`,`CHANGEDATE`,`MARK`,`MARKCNT`,`IDSPORT`) VALUES (10,'Название ивента10',1,1,1,'2013-04-17 10:22:00',4,4,1);

-- Query: SELECT * FROM mysport.gameparties
INSERT INTO `gameparties` (`IDGP`,`IDGAME`,`IDUSER`,`VISITED`,`MARK`,`IDTEAM`) VALUES (1,1,1,0,4,1);
INSERT INTO `gameparties` (`IDGP`,`IDGAME`,`IDUSER`,`VISITED`,`MARK`,`IDTEAM`) VALUES (2,1,2,0,4,1);
INSERT INTO `gameparties` (`IDGP`,`IDGAME`,`IDUSER`,`VISITED`,`MARK`,`IDTEAM`) VALUES (3,1,3,0,4,1);
INSERT INTO `gameparties` (`IDGP`,`IDGAME`,`IDUSER`,`VISITED`,`MARK`,`IDTEAM`) VALUES (4,1,4,0,4,1);
INSERT INTO `gameparties` (`IDGP`,`IDGAME`,`IDUSER`,`VISITED`,`MARK`,`IDTEAM`) VALUES (5,1,5,0,4,1);
INSERT INTO `gameparties` (`IDGP`,`IDGAME`,`IDUSER`,`VISITED`,`MARK`,`IDTEAM`) VALUES (6,1,6,0,4,1);
INSERT INTO `gameparties` (`IDGP`,`IDGAME`,`IDUSER`,`VISITED`,`MARK`,`IDTEAM`) VALUES (7,1,7,0,4,1);
INSERT INTO `gameparties` (`IDGP`,`IDGAME`,`IDUSER`,`VISITED`,`MARK`,`IDTEAM`) VALUES (8,1,8,0,4,1);

-- Query: SELECT * FROM mysport.gameratings
INSERT INTO `gameratings` (`IDGR`,`IDGAME`,`IDRANKEDPLAYER`,`IDESTIMATEPLAYER`,`ESTIMATEDATE`,`ESTIMATECOMMENT`) VALUES (1,1,1,2,'2013-06-16 09:24:00','ну и нубяра');
INSERT INTO `gameratings` (`IDGR`,`IDGAME`,`IDRANKEDPLAYER`,`IDESTIMATEPLAYER`,`ESTIMATEDATE`,`ESTIMATECOMMENT`) VALUES (2,1,2,1,'2013-06-16 09:27:00','от нуба слышу');
INSERT INTO `gameratings` (`IDGR`,`IDGAME`,`IDRANKEDPLAYER`,`IDESTIMATEPLAYER`,`ESTIMATEDATE`,`ESTIMATECOMMENT`) VALUES (3,1,3,1,'2013-06-16 09:27:00','игра зачетная была');
INSERT INTO `gameratings` (`IDGR`,`IDGAME`,`IDRANKEDPLAYER`,`IDESTIMATEPLAYER`,`ESTIMATEDATE`,`ESTIMATECOMMENT`) VALUES (4,1,1,3,'2013-06-16 09:27:00','игра фуфел');

-- Query: SELECT * FROM mysport.locations
INSERT INTO `locations` (`IDLOCATION`,`NAME`,`COUNTRY`,`REGION`,`CITY`,`DISTRICT`,`STREET`,`BUILDING`,`ZIP`,`DESCRIPTION`,`CONTACTS`,`HTTPLINK`,`STATUS`,`CHECKIN`,`IDCREATEDBY`,`CREATIONDATE`,`CHANGEDATE`,`IDCHANGEBY`,`TAG`,`LATITUDE`,`LONGTITUDE`,`PIC`) VALUES (1,'КПИ','Украина','Киев','Киев','Шевченковский район','ул.Политехническая','1','03092','Университет КПИ,первый корпус','+380445555555','http://kpi.ua/','WHITE',93,1,'2013-06-16 09:24:00','2013-06-16 09:24:00',1,'Soccer',NULL,NULL,NULL);
INSERT INTO `locations` (`IDLOCATION`,`NAME`,`COUNTRY`,`REGION`,`CITY`,`DISTRICT`,`STREET`,`BUILDING`,`ZIP`,`DESCRIPTION`,`CONTACTS`,`HTTPLINK`,`STATUS`,`CHECKIN`,`IDCREATEDBY`,`CREATIONDATE`,`CHANGEDATE`,`IDCHANGEBY`,`TAG`,`LATITUDE`,`LONGTITUDE`,`PIC`) VALUES (2,'КПИ-2','Украина','Киев','Киев','Шевченковский район','ул.Политехническая','2','03093','Университет КПИ,второй корпус','+380445555522','http://kpi.ua/','WHITE',14,1,'2013-06-16 09:24:00','2013-06-16 09:24:00',1,'Soccer',NULL,NULL,NULL);
INSERT INTO `locations` (`IDLOCATION`,`NAME`,`COUNTRY`,`REGION`,`CITY`,`DISTRICT`,`STREET`,`BUILDING`,`ZIP`,`DESCRIPTION`,`CONTACTS`,`HTTPLINK`,`STATUS`,`CHECKIN`,`IDCREATEDBY`,`CREATIONDATE`,`CHANGEDATE`,`IDCHANGEBY`,`TAG`,`LATITUDE`,`LONGTITUDE`,`PIC`) VALUES (3,'КПИ-3','Украина','Киев','Киев','Шевченковский район','ул.Политехническая','3','03092','Университет КПИ,третий корпус','+380445555555','http://kpi.ua/','BLACK',143,2,'2013-06-16 09:24:00','2013-06-16 09:24:00',2,'Soccer',NULL,NULL,NULL);
INSERT INTO `locations` (`IDLOCATION`,`NAME`,`COUNTRY`,`REGION`,`CITY`,`DISTRICT`,`STREET`,`BUILDING`,`ZIP`,`DESCRIPTION`,`CONTACTS`,`HTTPLINK`,`STATUS`,`CHECKIN`,`IDCREATEDBY`,`CREATIONDATE`,`CHANGEDATE`,`IDCHANGEBY`,`TAG`,`LATITUDE`,`LONGTITUDE`,`PIC`) VALUES (4,'КПИ-4','Украина','Киев','Киев','Шевченковский район','ул.Политехническая','4','03091','Университет КПИ,четвертый корпус',NULL,'http://kpi.ua/','WHITE',930,2,'2013-06-16 09:24:00','2013-06-16 09:24:00',3,'Soccer',NULL,NULL,NULL);
INSERT INTO `locations` (`IDLOCATION`,`NAME`,`COUNTRY`,`REGION`,`CITY`,`DISTRICT`,`STREET`,`BUILDING`,`ZIP`,`DESCRIPTION`,`CONTACTS`,`HTTPLINK`,`STATUS`,`CHECKIN`,`IDCREATEDBY`,`CREATIONDATE`,`CHANGEDATE`,`IDCHANGEBY`,`TAG`,`LATITUDE`,`LONGTITUDE`,`PIC`) VALUES (5,'КПИ-5','Украина','Киев','Киев','Шевченковский район','ул.Политехническая','5','03092','Университет КПИ','+380445555555','http://kpi.ua/','WHITE',0,3,'2013-06-16 09:24:00','2013-06-16 09:24:00',2,'Soccer',NULL,NULL,NULL);
INSERT INTO `locations` (`IDLOCATION`,`NAME`,`COUNTRY`,`REGION`,`CITY`,`DISTRICT`,`STREET`,`BUILDING`,`ZIP`,`DESCRIPTION`,`CONTACTS`,`HTTPLINK`,`STATUS`,`CHECKIN`,`IDCREATEDBY`,`CREATIONDATE`,`CHANGEDATE`,`IDCHANGEBY`,`TAG`,`LATITUDE`,`LONGTITUDE`,`PIC`) VALUES (6,'НУХТ','Украина','Киев','Киев','Шевченковский район','ул.Политехническая','2','03093','Университет КПИ,второй корпус','+380445555522','http://kpi.ua/','WHITE',14,1,'2013-06-16 09:24:00','2013-06-16 09:24:00',1,'Soccer',NULL,NULL,NULL);
INSERT INTO `locations` (`IDLOCATION`,`NAME`,`COUNTRY`,`REGION`,`CITY`,`DISTRICT`,`STREET`,`BUILDING`,`ZIP`,`DESCRIPTION`,`CONTACTS`,`HTTPLINK`,`STATUS`,`CHECKIN`,`IDCREATEDBY`,`CREATIONDATE`,`CHANGEDATE`,`IDCHANGEBY`,`TAG`,`LATITUDE`,`LONGTITUDE`,`PIC`) VALUES (7,'ДУХТ','Украина','Киев','Киев','Шевченковский район','ул.Политехническая','3','03092','Университет КПИ,третий корпус','+380445555555','http://kpi.ua/','BLACK',143,2,'2013-06-16 09:24:00','2013-06-16 09:24:00',2,'Soccer',NULL,NULL,NULL);
INSERT INTO `locations` (`IDLOCATION`,`NAME`,`COUNTRY`,`REGION`,`CITY`,`DISTRICT`,`STREET`,`BUILDING`,`ZIP`,`DESCRIPTION`,`CONTACTS`,`HTTPLINK`,`STATUS`,`CHECKIN`,`IDCREATEDBY`,`CREATIONDATE`,`CHANGEDATE`,`IDCHANGEBY`,`TAG`,`LATITUDE`,`LONGTITUDE`,`PIC`) VALUES (8,'Шевченка','Украина','Киев','Киев','Шевченковский район','ул.Политехническая','4','03091','Университет КПИ,четвертый корпус',NULL,'http://kpi.ua/','WHITE',930,2,'2013-06-16 09:24:00','2013-06-16 09:24:00',3,'Soccer',NULL,NULL,NULL);
INSERT INTO `locations` (`IDLOCATION`,`NAME`,`COUNTRY`,`REGION`,`CITY`,`DISTRICT`,`STREET`,`BUILDING`,`ZIP`,`DESCRIPTION`,`CONTACTS`,`HTTPLINK`,`STATUS`,`CHECKIN`,`IDCREATEDBY`,`CREATIONDATE`,`CHANGEDATE`,`IDCHANGEBY`,`TAG`,`LATITUDE`,`LONGTITUDE`,`PIC`) VALUES (9,'Васюки','Украина','Киевская область','Васюки','Васюковский район','ул.Васюковская','10','03092','Васюковское ПТУ','+380445555555','http://kpi.ua/','WHITE',0,3,'2013-06-16 09:24:00','2013-06-16 09:24:00',2,'Soccer',NULL,NULL,NULL);

-- Query: SELECT * FROM mysport.sports
INSERT INTO `sports` (`IDSPORT`,`NAME`,`RULES`,`HTTPLINK`) VALUES (1,'Футбол','бить мяч ногами','http://uefa.com');
INSERT INTO `sports` (`IDSPORT`,`NAME`,`RULES`,`HTTPLINK`) VALUES (2,'Баскетбол','кидать мяч в корзину','http://en.wikipedia.org/wiki/Basketball');
INSERT INTO `sports` (`IDSPORT`,`NAME`,`RULES`,`HTTPLINK`) VALUES (3,'Волейбол','спортивна гра з м''ячем','http://google.com');
INSERT INTO `sports` (`IDSPORT`,`NAME`,`RULES`,`HTTPLINK`) VALUES (4,'плавание','учимся плавать','http://google.com');
INSERT INTO `sports` (`IDSPORT`,`NAME`,`RULES`,`HTTPLINK`) VALUES (5,'Бокс','Квасить нос','http://google.com');
INSERT INTO `sports` (`IDSPORT`,`NAME`,`RULES`,`HTTPLINK`) VALUES (6,'Хоккей','Спорт для настоящих мужчин','http://google.com');
INSERT INTO `sports` (`IDSPORT`,`NAME`,`RULES`,`HTTPLINK`) VALUES (7,'Курить траву','Это не спорт','http://google.com');

-- Query: SELECT * FROM mysport.trainingplan
INSERT INTO `trainingplan` (`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`NAMETP`,`DESCRIPTION`,`IDSPORT`,`TARGET`,`IDLOCATION`,`DOW1`,`DOW2`,`DOW3`,`DOW4`,`DOW5`,`DOW6`,`DOW7`,`ISPAUSE`,`IMPORTEVENTS`,`COPYDATA`,`RATING`,`RATINGDATE`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (1,1,'2012-04-13 06:02:00','мой 1 футбольный план','описание футбольного плана тренировок(id sport=1,target=5,idlocation=1)',1,5,1,0,0,0,0,0,0,0,1,0,1,100,'2013-04-13 06:02:00',1,'2013-04-13 12:02:00');
INSERT INTO `trainingplan` (`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`NAMETP`,`DESCRIPTION`,`IDSPORT`,`TARGET`,`IDLOCATION`,`DOW1`,`DOW2`,`DOW3`,`DOW4`,`DOW5`,`DOW6`,`DOW7`,`ISPAUSE`,`IMPORTEVENTS`,`COPYDATA`,`RATING`,`RATINGDATE`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (2,1,'2013-04-13 06:02:00','мой 2 футбольный план','описание футбольного плана тренировок(id sport=1,target=2,idlocation=1)',1,2,1,0,0,0,0,0,0,0,1,0,1,100,'2013-04-13 06:02:00',1,'2013-04-13 12:02:00');
INSERT INTO `trainingplan` (`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`NAMETP`,`DESCRIPTION`,`IDSPORT`,`TARGET`,`IDLOCATION`,`DOW1`,`DOW2`,`DOW3`,`DOW4`,`DOW5`,`DOW6`,`DOW7`,`ISPAUSE`,`IMPORTEVENTS`,`COPYDATA`,`RATING`,`RATINGDATE`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (3,1,'2013-04-13 06:04:00','мой 3 футбольный план','описание футбольного плана тренировок(id sport=1,target=5,idlocation=1)',1,5,1,0,0,0,0,0,0,0,1,0,1,100,'2013-04-13 06:02:00',1,'2013-04-13 12:02:00');
INSERT INTO `trainingplan` (`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`NAMETP`,`DESCRIPTION`,`IDSPORT`,`TARGET`,`IDLOCATION`,`DOW1`,`DOW2`,`DOW3`,`DOW4`,`DOW5`,`DOW6`,`DOW7`,`ISPAUSE`,`IMPORTEVENTS`,`COPYDATA`,`RATING`,`RATINGDATE`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (4,1,'2013-04-13 06:05:00','мой 4 футбольный план','описание футбольного плана тренировок(id sport=1,target=3,idlocation=1)',1,3,1,0,0,0,0,0,0,0,1,0,1,100,'2013-04-13 06:02:00',1,'2013-04-13 08:02:00');
INSERT INTO `trainingplan` (`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`NAMETP`,`DESCRIPTION`,`IDSPORT`,`TARGET`,`IDLOCATION`,`DOW1`,`DOW2`,`DOW3`,`DOW4`,`DOW5`,`DOW6`,`DOW7`,`ISPAUSE`,`IMPORTEVENTS`,`COPYDATA`,`RATING`,`RATINGDATE`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (5,1,'2013-04-13 06:06:00','мой 5 футбольный план','описание футбольного плана тренировок(id sport=1,target=7,idlocation=1)',1,7,1,0,0,0,0,0,0,0,1,0,1,100,'2013-04-13 06:02:00',1,'2013-04-13 12:02:00');
INSERT INTO `trainingplan` (`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`NAMETP`,`DESCRIPTION`,`IDSPORT`,`TARGET`,`IDLOCATION`,`DOW1`,`DOW2`,`DOW3`,`DOW4`,`DOW5`,`DOW6`,`DOW7`,`ISPAUSE`,`IMPORTEVENTS`,`COPYDATA`,`RATING`,`RATINGDATE`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (6,1,'2013-04-13 06:07:00','мой 6 футбольный план','описание футбольного плана тренировок(id sport=1,target=0,idlocation=2)',1,0,2,0,0,0,0,0,0,0,1,0,1,100,'2013-04-13 06:02:00',1,'2013-04-13 12:02:00');
INSERT INTO `trainingplan` (`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`NAMETP`,`DESCRIPTION`,`IDSPORT`,`TARGET`,`IDLOCATION`,`DOW1`,`DOW2`,`DOW3`,`DOW4`,`DOW5`,`DOW6`,`DOW7`,`ISPAUSE`,`IMPORTEVENTS`,`COPYDATA`,`RATING`,`RATINGDATE`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (7,1,'2013-04-13 06:08:00','мой 7 футбольный план','описание футбольного плана тренировок(id sport=1,target=0,idlocation=2)',1,0,2,0,0,0,0,0,0,0,1,0,1,100,'2013-04-13 06:02:00',1,'2013-04-13 12:02:00');
INSERT INTO `trainingplan` (`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`NAMETP`,`DESCRIPTION`,`IDSPORT`,`TARGET`,`IDLOCATION`,`DOW1`,`DOW2`,`DOW3`,`DOW4`,`DOW5`,`DOW6`,`DOW7`,`ISPAUSE`,`IMPORTEVENTS`,`COPYDATA`,`RATING`,`RATINGDATE`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (8,1,'2013-04-13 06:09:00','мой 8 футбольный план','описание футбольного плана тренировок(id sport=1,target=0,idlocation=2)',1,0,2,0,0,0,0,0,0,0,1,0,1,100,'2013-04-13 06:02:00',1,'2013-04-13 12:02:00');
INSERT INTO `trainingplan` (`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`NAMETP`,`DESCRIPTION`,`IDSPORT`,`TARGET`,`IDLOCATION`,`DOW1`,`DOW2`,`DOW3`,`DOW4`,`DOW5`,`DOW6`,`DOW7`,`ISPAUSE`,`IMPORTEVENTS`,`COPYDATA`,`RATING`,`RATINGDATE`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (9,2,'2013-04-13 06:10:00','мой 9 футбольный план','описание футбольного плана тренировок(id sport=1,target=0,idlocation=2)',1,0,2,0,0,0,0,0,0,0,1,0,1,100,'2013-04-13 06:02:00',1,'2013-04-13 12:02:00');
INSERT INTO `trainingplan` (`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`NAMETP`,`DESCRIPTION`,`IDSPORT`,`TARGET`,`IDLOCATION`,`DOW1`,`DOW2`,`DOW3`,`DOW4`,`DOW5`,`DOW6`,`DOW7`,`ISPAUSE`,`IMPORTEVENTS`,`COPYDATA`,`RATING`,`RATINGDATE`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (10,2,'2013-04-13 06:11:00','мой 10 футбольный план','описание футбольного плана тренировок(id sport=1,target=0,idlocation=1)',1,0,1,0,0,0,0,0,0,0,1,0,1,100,'2013-04-13 06:02:00',1,'2013-04-13 12:02:00');
INSERT INTO `trainingplan` (`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`NAMETP`,`DESCRIPTION`,`IDSPORT`,`TARGET`,`IDLOCATION`,`DOW1`,`DOW2`,`DOW3`,`DOW4`,`DOW5`,`DOW6`,`DOW7`,`ISPAUSE`,`IMPORTEVENTS`,`COPYDATA`,`RATING`,`RATINGDATE`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (11,2,'2013-04-13 06:12:00','мой 11 футбольный план','описание футбольного плана тренировок(id sport=1,target=0,idlocation=1)',1,0,1,0,0,0,0,0,0,0,1,0,1,100,'2013-04-13 06:02:00',1,'2013-04-13 12:02:00');
INSERT INTO `trainingplan` (`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`NAMETP`,`DESCRIPTION`,`IDSPORT`,`TARGET`,`IDLOCATION`,`DOW1`,`DOW2`,`DOW3`,`DOW4`,`DOW5`,`DOW6`,`DOW7`,`ISPAUSE`,`IMPORTEVENTS`,`COPYDATA`,`RATING`,`RATINGDATE`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (12,3,'2013-04-13 06:14:00','мой 12 футбольный план','описание футбольного плана тренировок(id sport=1,target=0,idlocation=1)',1,0,1,0,0,0,0,0,0,0,1,0,1,100,'2013-04-13 06:02:00',1,'2013-04-13 08:02:00');
INSERT INTO `trainingplan` (`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`NAMETP`,`DESCRIPTION`,`IDSPORT`,`TARGET`,`IDLOCATION`,`DOW1`,`DOW2`,`DOW3`,`DOW4`,`DOW5`,`DOW6`,`DOW7`,`ISPAUSE`,`IMPORTEVENTS`,`COPYDATA`,`RATING`,`RATINGDATE`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (13,3,'2013-04-13 06:15:00','мой 13 футбольный план','описание футбольного плана тренировок(id sport=1,target=0,idlocation=1)',1,0,1,0,0,0,0,0,0,0,1,0,1,100,'2013-04-13 06:02:00',1,'2013-04-13 12:02:00');
INSERT INTO `trainingplan` (`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`NAMETP`,`DESCRIPTION`,`IDSPORT`,`TARGET`,`IDLOCATION`,`DOW1`,`DOW2`,`DOW3`,`DOW4`,`DOW5`,`DOW6`,`DOW7`,`ISPAUSE`,`IMPORTEVENTS`,`COPYDATA`,`RATING`,`RATINGDATE`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (14,3,'2013-04-13 06:15:00','мой 14 футбольный план','описание футбольного плана тренировок(id sport=1,target=0,idlocation=1)',1,0,1,0,0,0,0,0,0,0,1,0,1,100,'2013-04-13 06:02:00',1,'2013-04-13 12:02:00');
INSERT INTO `trainingplan` (`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`NAMETP`,`DESCRIPTION`,`IDSPORT`,`TARGET`,`IDLOCATION`,`DOW1`,`DOW2`,`DOW3`,`DOW4`,`DOW5`,`DOW6`,`DOW7`,`ISPAUSE`,`IMPORTEVENTS`,`COPYDATA`,`RATING`,`RATINGDATE`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (15,3,'2013-04-13 06:17:00','мой 15 футбольный план','описание футбольного плана тренировок(id sport=1,target=0,idlocation=1)',1,0,1,0,0,0,0,0,0,0,1,0,1,100,'2013-04-13 06:02:00',1,NULL);

-- Query: SELECT * FROM mysport.trainings
INSERT INTO `trainings` (`IDT`,`DESCRIPTION`,`IDTW`,`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`TRAINSDATE`,`TRAINSNUM`,`IDLOCATION`,`IDPARTY`,`ADDITIONALINFO`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (1,'Описание Тренинга',1,1,2,'2013-06-16 09:24:00','2013-09-16 09:24:02','2','1',2,0,1,'2013-10-16 09:24:02');
INSERT INTO `trainings` (`IDT`,`DESCRIPTION`,`IDTW`,`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`TRAINSDATE`,`TRAINSNUM`,`IDLOCATION`,`IDPARTY`,`ADDITIONALINFO`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (2,'Неделя вторая',2,1,2,'2013-07-16 09:24:00','2013-09-16 09:24:02','2','1',2,0,1,'2013-10-16 09:24:02');
INSERT INTO `trainings` (`IDT`,`DESCRIPTION`,`IDTW`,`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`TRAINSDATE`,`TRAINSNUM`,`IDLOCATION`,`IDPARTY`,`ADDITIONALINFO`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (3,'Неделя третья',3,1,2,'2013-08-16 09:24:00','2013-09-16 09:24:02','2','1',2,0,1,'2013-10-16 09:24:02');
INSERT INTO `trainings` (`IDT`,`DESCRIPTION`,`IDTW`,`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`TRAINSDATE`,`TRAINSNUM`,`IDLOCATION`,`IDPARTY`,`ADDITIONALINFO`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (4,'Неделя четвертая',4,1,2,'2013-09-16 09:24:00','2013-09-16 09:24:02','2','1',2,0,1,'2013-10-16 09:24:02');
INSERT INTO `trainings` (`IDT`,`DESCRIPTION`,`IDTW`,`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`TRAINSDATE`,`TRAINSNUM`,`IDLOCATION`,`IDPARTY`,`ADDITIONALINFO`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (5,'Неделя пятая',5,1,2,'2013-10-16 09:24:00','2013-09-16 09:24:02','2','1',2,0,1,'2013-10-16 09:24:02');
INSERT INTO `trainings` (`IDT`,`DESCRIPTION`,`IDTW`,`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`TRAINSDATE`,`TRAINSNUM`,`IDLOCATION`,`IDPARTY`,`ADDITIONALINFO`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (6,'Неделя шестая',6,1,2,'2013-10-18 09:24:00','2013-09-16 09:24:02','2','1',2,0,1,'2013-10-16 09:24:02');
INSERT INTO `trainings` (`IDT`,`DESCRIPTION`,`IDTW`,`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`TRAINSDATE`,`TRAINSNUM`,`IDLOCATION`,`IDPARTY`,`ADDITIONALINFO`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (7,'Неделя седьмая',7,1,2,'2013-10-19 09:24:00','2013-09-16 09:24:02','2','1',2,0,1,'2013-10-16 09:24:02');
INSERT INTO `trainings` (`IDT`,`DESCRIPTION`,`IDTW`,`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`TRAINSDATE`,`TRAINSNUM`,`IDLOCATION`,`IDPARTY`,`ADDITIONALINFO`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (8,'Неделя восьмая',8,1,2,'2013-10-20 09:24:00','2013-09-16 09:24:02','2','1',2,0,1,'2013-10-16 09:24:02');

-- Query: SELECT * FROM mysport.trainingweek
INSERT INTO `trainingweek` (`IDTW`,`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`WEEKNUM`,`WEEKDBEGIN`,`WEEKDEND`,`TARGET`,`IDLOCATION`,`DOW1`,`DOW2`,`DOW3`,`DOW4`,`DOW5`,`DOW6`,`DOW7`,`ISPAUSE`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (1,1,1,'2013-06-16 09:24:00',1,'2013-06-16 09:24:00','2013-09-16 09:24:00',20,1,0,0,0,0,0,0,0,0,1,'2013-10-16 09:24:02');
INSERT INTO `trainingweek` (`IDTW`,`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`WEEKNUM`,`WEEKDBEGIN`,`WEEKDEND`,`TARGET`,`IDLOCATION`,`DOW1`,`DOW2`,`DOW3`,`DOW4`,`DOW5`,`DOW6`,`DOW7`,`ISPAUSE`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (2,1,1,'2013-06-16 09:24:00',1,'2013-06-16 09:24:00','2013-09-16 09:24:00',20,1,0,0,0,0,0,0,0,0,1,'2013-10-17 09:24:02');
INSERT INTO `trainingweek` (`IDTW`,`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`WEEKNUM`,`WEEKDBEGIN`,`WEEKDEND`,`TARGET`,`IDLOCATION`,`DOW1`,`DOW2`,`DOW3`,`DOW4`,`DOW5`,`DOW6`,`DOW7`,`ISPAUSE`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (3,1,1,'2013-06-16 09:24:00',1,'2013-06-16 09:24:00','2013-09-16 09:24:00',20,1,0,0,0,0,0,0,0,0,1,'2013-10-17 09:24:02');
INSERT INTO `trainingweek` (`IDTW`,`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`WEEKNUM`,`WEEKDBEGIN`,`WEEKDEND`,`TARGET`,`IDLOCATION`,`DOW1`,`DOW2`,`DOW3`,`DOW4`,`DOW5`,`DOW6`,`DOW7`,`ISPAUSE`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (4,1,1,'2013-06-16 09:24:00',1,'2013-06-16 09:24:00','2013-09-16 09:24:00',20,1,0,0,0,0,0,0,0,0,1,'2013-10-14 09:24:02');
INSERT INTO `trainingweek` (`IDTW`,`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`WEEKNUM`,`WEEKDBEGIN`,`WEEKDEND`,`TARGET`,`IDLOCATION`,`DOW1`,`DOW2`,`DOW3`,`DOW4`,`DOW5`,`DOW6`,`DOW7`,`ISPAUSE`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (5,1,1,'2013-06-16 09:24:00',1,'2013-06-16 09:24:00','2013-09-16 09:24:00',20,1,0,0,0,0,0,0,0,0,1,'2013-10-23 09:24:02');
INSERT INTO `trainingweek` (`IDTW`,`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`WEEKNUM`,`WEEKDBEGIN`,`WEEKDEND`,`TARGET`,`IDLOCATION`,`DOW1`,`DOW2`,`DOW3`,`DOW4`,`DOW5`,`DOW6`,`DOW7`,`ISPAUSE`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (6,1,1,'2013-06-16 09:24:00',1,'2013-06-16 09:24:00','2013-09-16 09:24:00',20,1,0,0,0,0,0,0,0,0,2,'2013-10-24 09:24:02');
INSERT INTO `trainingweek` (`IDTW`,`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`WEEKNUM`,`WEEKDBEGIN`,`WEEKDEND`,`TARGET`,`IDLOCATION`,`DOW1`,`DOW2`,`DOW3`,`DOW4`,`DOW5`,`DOW6`,`DOW7`,`ISPAUSE`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (7,1,1,'2013-06-16 09:24:00',1,'2013-06-16 09:24:00','2013-09-16 09:24:00',20,1,0,0,0,0,0,0,0,0,1,'2013-10-26 09:24:02');
INSERT INTO `trainingweek` (`IDTW`,`IDTP`,`IDCREATEDBY`,`CREATIONDATE`,`WEEKNUM`,`WEEKDBEGIN`,`WEEKDEND`,`TARGET`,`IDLOCATION`,`DOW1`,`DOW2`,`DOW3`,`DOW4`,`DOW5`,`DOW6`,`DOW7`,`ISPAUSE`,`IDCHANGEBY`,`CHANGEDATE`) VALUES (8,1,1,'2013-06-16 09:24:00',2,'2013-06-16 09:24:00','2013-09-16 09:24:00',20,1,0,0,0,0,0,0,0,0,1,'2013-09-16 09:24:02');

-- Query: SELECT * FROM mysport.users
INSERT INTO `users` (`IDUSER`,`ISBOT`,`IDCREATEDBY`,`NICKNAME`,`FIRSTNAME`,`LASTNAME`,`MIDDLENAME`,`MPHONE`,`EMAIL`,`ISEMAILVERIFIED`,`SOCIALNETWORKLOGIN`,`SOCIALNETWORKTYPE`,`BIRTHDATE`,`PERFMARK`,`REPMARK`,`POSITIVEREP`,`NEGATIVEREP`,`STATUS`,`LOCALE`,`GMT`,`PWD`,`CREATIONDATE`,`CHANGEDATE`,`IDCHANGEBY`) VALUES (1,0,1,'omedynskyy','oleksandr','medynski','slavovich','+380935555555','pupkin@gvardia.com',0,'aleksandr.medynskyy@uzbeki.com','facebook','1984-02-25 12:20:00',100.00,110.00,3100,10,'1','ua','+03:00','omedynskyy','2013-05-16 09:24:00','2013-12-06 23:55:58',1);
INSERT INTO `users` (`IDUSER`,`ISBOT`,`IDCREATEDBY`,`NICKNAME`,`FIRSTNAME`,`LASTNAME`,`MIDDLENAME`,`MPHONE`,`EMAIL`,`ISEMAILVERIFIED`,`SOCIALNETWORKLOGIN`,`SOCIALNETWORKTYPE`,`BIRTHDATE`,`PERFMARK`,`REPMARK`,`POSITIVEREP`,`NEGATIVEREP`,`STATUS`,`LOCALE`,`GMT`,`PWD`,`CREATIONDATE`,`CHANGEDATE`,`IDCHANGEBY`) VALUES (2,0,2,'ogumennyy','oleg','gumennyy',NULL,'+380637777777','player@soveti.com',1,'oleg.gumennyy@strana.com','facebook','1986-02-25 12:20:00',110.00,100.00,3200,20,'1','ua','+01:00','ogumennyy','2013-08-16 09:24:00','2013-12-06 23:55:58',2);
INSERT INTO `users` (`IDUSER`,`ISBOT`,`IDCREATEDBY`,`NICKNAME`,`FIRSTNAME`,`LASTNAME`,`MIDDLENAME`,`MPHONE`,`EMAIL`,`ISEMAILVERIFIED`,`SOCIALNETWORKLOGIN`,`SOCIALNETWORKTYPE`,`BIRTHDATE`,`PERFMARK`,`REPMARK`,`POSITIVEREP`,`NEGATIVEREP`,`STATUS`,`LOCALE`,`GMT`,`PWD`,`CREATIONDATE`,`CHANGEDATE`,`IDCHANGEBY`) VALUES (3,0,3,'strelez',NULL,NULL,NULL,'+380935555555','strekez@gvardia.com',0,NULL,NULL,'1984-02-25 12:20:00',100.00,110.00,3100,10,'1','ru','+03:00','mypassword','2013-05-16 09:24:00','2013-05-16 09:24:00',3);
INSERT INTO `users` (`IDUSER`,`ISBOT`,`IDCREATEDBY`,`NICKNAME`,`FIRSTNAME`,`LASTNAME`,`MIDDLENAME`,`MPHONE`,`EMAIL`,`ISEMAILVERIFIED`,`SOCIALNETWORKLOGIN`,`SOCIALNETWORKTYPE`,`BIRTHDATE`,`PERFMARK`,`REPMARK`,`POSITIVEREP`,`NEGATIVEREP`,`STATUS`,`LOCALE`,`GMT`,`PWD`,`CREATIONDATE`,`CHANGEDATE`,`IDCHANGEBY`) VALUES (4,0,4,'ramzes','ramzik','ramzikovich',NULL,'+380630000000','player43@soveti.com',1,'oleg.gumennyy@strana.com','facebook','1999-02-25 12:20:00',110.00,100.00,3200,20,'1','ua','+03:00','mypassword','2013-08-16 06:24:00','2013-12-06 23:55:58',4);
INSERT INTO `users` (`IDUSER`,`ISBOT`,`IDCREATEDBY`,`NICKNAME`,`FIRSTNAME`,`LASTNAME`,`MIDDLENAME`,`MPHONE`,`EMAIL`,`ISEMAILVERIFIED`,`SOCIALNETWORKLOGIN`,`SOCIALNETWORKTYPE`,`BIRTHDATE`,`PERFMARK`,`REPMARK`,`POSITIVEREP`,`NEGATIVEREP`,`STATUS`,`LOCALE`,`GMT`,`PWD`,`CREATIONDATE`,`CHANGEDATE`,`IDCHANGEBY`) VALUES (5,0,5,'onur','onur','fatih','fatihovich','+380935555555','player433@soveti.com',0,'fatihovich@uzbeki.com','googleplus','2001-02-25 12:20:00',100.00,110.00,3100,10,'1','en','-02:00','mypassword','2013-05-16 09:24:00','2013-12-06 23:55:58',5);
INSERT INTO `users` (`IDUSER`,`ISBOT`,`IDCREATEDBY`,`NICKNAME`,`FIRSTNAME`,`LASTNAME`,`MIDDLENAME`,`MPHONE`,`EMAIL`,`ISEMAILVERIFIED`,`SOCIALNETWORKLOGIN`,`SOCIALNETWORKTYPE`,`BIRTHDATE`,`PERFMARK`,`REPMARK`,`POSITIVEREP`,`NEGATIVEREP`,`STATUS`,`LOCALE`,`GMT`,`PWD`,`CREATIONDATE`,`CHANGEDATE`,`IDCHANGEBY`) VALUES (6,1,6,'omar','omarik','omarenko','omarovich','+38053555555','bot@gvardia.com',1,NULL,NULL,'1984-02-25 12:20:00',200.00,110.00,3100,10,'1','ua','+05:30','mypassword','2013-05-16 01:24:00','2013-12-06 23:55:58',6);
INSERT INTO `users` (`IDUSER`,`ISBOT`,`IDCREATEDBY`,`NICKNAME`,`FIRSTNAME`,`LASTNAME`,`MIDDLENAME`,`MPHONE`,`EMAIL`,`ISEMAILVERIFIED`,`SOCIALNETWORKLOGIN`,`SOCIALNETWORKTYPE`,`BIRTHDATE`,`PERFMARK`,`REPMARK`,`POSITIVEREP`,`NEGATIVEREP`,`STATUS`,`LOCALE`,`GMT`,`PWD`,`CREATIONDATE`,`CHANGEDATE`,`IDCHANGEBY`) VALUES (7,0,7,'onur40','onur','fatih','fatihovich','+380935555555','playerOnur40@soveti.com',0,'onur40@uzbeki.com','googleplus','1978-02-25 12:20:00',100.00,110.00,3100,10,'1','en','-02:00','mypassword','2013-05-16 09:24:00','2013-12-06 23:55:58',5);
INSERT INTO `users` (`IDUSER`,`ISBOT`,`IDCREATEDBY`,`NICKNAME`,`FIRSTNAME`,`LASTNAME`,`MIDDLENAME`,`MPHONE`,`EMAIL`,`ISEMAILVERIFIED`,`SOCIALNETWORKLOGIN`,`SOCIALNETWORKTYPE`,`BIRTHDATE`,`PERFMARK`,`REPMARK`,`POSITIVEREP`,`NEGATIVEREP`,`STATUS`,`LOCALE`,`GMT`,`PWD`,`CREATIONDATE`,`CHANGEDATE`,`IDCHANGEBY`) VALUES (8,0,8,'kostoprav',NULL,NULL,NULL,'+380935555555','kostoprav@soveti.com',0,'kostoprav@soveti.com','googleplus','1954-02-25 12:20:00',100.00,110.00,3100,10,'1','en','-02:00','mypassword','2013-05-16 09:24:00','2013-12-06 23:55:58',5);
INSERT INTO `users` (`IDUSER`,`ISBOT`,`IDCREATEDBY`,`NICKNAME`,`FIRSTNAME`,`LASTNAME`,`MIDDLENAME`,`MPHONE`,`EMAIL`,`ISEMAILVERIFIED`,`SOCIALNETWORKLOGIN`,`SOCIALNETWORKTYPE`,`BIRTHDATE`,`PERFMARK`,`REPMARK`,`POSITIVEREP`,`NEGATIVEREP`,`STATUS`,`LOCALE`,`GMT`,`PWD`,`CREATIONDATE`,`CHANGEDATE`,`IDCHANGEBY`) VALUES (9,0,2,'igromskyy','Ivan','Gromskyy','Vitalievich','+380930000000','igromskyy@test.ua',0,'igromskyy@test.ua','googleplus','1985-02-25 12:20:00',99.00,110.00,3100,10,'1','en','+01:00','igromskyy','2013-05-16 09:24:00','2013-12-06 23:56:50',2);
INSERT INTO `users` (`IDUSER`,`ISBOT`,`IDCREATEDBY`,`NICKNAME`,`FIRSTNAME`,`LASTNAME`,`MIDDLENAME`,`MPHONE`,`EMAIL`,`ISEMAILVERIFIED`,`SOCIALNETWORKLOGIN`,`SOCIALNETWORKTYPE`,`BIRTHDATE`,`PERFMARK`,`REPMARK`,`POSITIVEREP`,`NEGATIVEREP`,`STATUS`,`LOCALE`,`GMT`,`PWD`,`CREATIONDATE`,`CHANGEDATE`,`IDCHANGEBY`) VALUES (10,0,9,'nzakrevskaya','Nadezhda','Zakrevskaya',NULL,'+380930001111','nzakrevskaya@test.ua',0,'nzakrevskaya@test.ua','googleplus','1982-02-25 12:20:00',100.00,110.00,3100,9,'1','ua','+01:00','nzakrevskaya','2013-05-16 09:24:00','2013-05-16 09:24:00',9);
INSERT INTO `users` (`IDUSER`,`ISBOT`,`IDCREATEDBY`,`NICKNAME`,`FIRSTNAME`,`LASTNAME`,`MIDDLENAME`,`MPHONE`,`EMAIL`,`ISEMAILVERIFIED`,`SOCIALNETWORKLOGIN`,`SOCIALNETWORKTYPE`,`BIRTHDATE`,`PERFMARK`,`REPMARK`,`POSITIVEREP`,`NEGATIVEREP`,`STATUS`,`LOCALE`,`GMT`,`PWD`,`CREATIONDATE`,`CHANGEDATE`,`IDCHANGEBY`) VALUES (11,0,9,'sscherban','Sergey','Scherban',NULL,'+380930002222','sscherban@test.ua',0,'sscherban@test.ua','googleplus','1985-11-25 12:20:00',200.00,90.00,1200,50,'1','ua','+01:00','sscherban','2013-05-16 09:24:00','2013-05-16 09:24:00',9);
INSERT INTO `users` (`IDUSER`,`ISBOT`,`IDCREATEDBY`,`NICKNAME`,`FIRSTNAME`,`LASTNAME`,`MIDDLENAME`,`MPHONE`,`EMAIL`,`ISEMAILVERIFIED`,`SOCIALNETWORKLOGIN`,`SOCIALNETWORKTYPE`,`BIRTHDATE`,`PERFMARK`,`REPMARK`,`POSITIVEREP`,`NEGATIVEREP`,`STATUS`,`LOCALE`,`GMT`,`PWD`,`CREATIONDATE`,`CHANGEDATE`,`IDCHANGEBY`) VALUES (12,0,9,'omoniatovskyy','Oleksiy','Moniatovskyy',NULL,'+380930003333','omoniatovskyy@test.ua',0,'omoniatovskyy@test.ua','googleplus','1988-11-25 12:20:00',200.00,90.00,3000,99,'1','en','+01:00','omoniatovskyy','2013-05-16 09:24:00','2013-05-16 09:24:00',9);

-- Query: SELECT * FROM mysport.userskill
INSERT INTO `userskill` (`ID`,`IDUSER`,`IDSPORT`,`ACTCNT`,`LASTACTDATE`,`ACTRATING`,`ACTRATINGCNT`,`PERFMARK`,`SELFRATING`,`CHANGEDATE`,`IDCHANGEBY`) VALUES (1,1,1,3,'2013-06-16 09:24:00',30.00,40,5.00,8,'2013-01-16 09:24:00',1);
INSERT INTO `userskill` (`ID`,`IDUSER`,`IDSPORT`,`ACTCNT`,`LASTACTDATE`,`ACTRATING`,`ACTRATINGCNT`,`PERFMARK`,`SELFRATING`,`CHANGEDATE`,`IDCHANGEBY`) VALUES (2,2,1,3,'2013-06-16 09:24:00',30.00,40,5.00,8,'2013-05-16 09:24:00',2);
INSERT INTO `userskill` (`ID`,`IDUSER`,`IDSPORT`,`ACTCNT`,`LASTACTDATE`,`ACTRATING`,`ACTRATINGCNT`,`PERFMARK`,`SELFRATING`,`CHANGEDATE`,`IDCHANGEBY`) VALUES (3,3,1,3,'2013-06-16 09:24:00',30.00,40,5.00,8,'2013-03-16 09:24:00',3);
INSERT INTO `userskill` (`ID`,`IDUSER`,`IDSPORT`,`ACTCNT`,`LASTACTDATE`,`ACTRATING`,`ACTRATINGCNT`,`PERFMARK`,`SELFRATING`,`CHANGEDATE`,`IDCHANGEBY`) VALUES (4,4,1,3,'2013-06-16 09:24:00',30.00,40,5.00,8,'2013-02-16 09:24:00',4);

