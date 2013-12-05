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
