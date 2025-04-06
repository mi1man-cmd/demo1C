﻿#language: ru

@tree

Функционал: создание документа Поступление товаров

Как Менеджер по закупкам я хочу
создание документа Поступление товаров 
чтобы поставить товар на учет   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: создание документа Поступление товаров
// создание
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю "Закупки" "Поступления товаров"
	Тогда открылось окно "Поступления товаров"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно "Поступление товара (создание)"
* Заполнение шапки документа
	И из выпадающего списка с именем 'Организация' я выбираю точное значение "ООО \"Товары\""
	И из выпадающего списка с именем 'Склад' я выбираю точное значение "Малый"
	// проверка что Склад выбран и равен "Малый"
	Тогда элемент формы с именем 'Склад' стал равен "Малый"
	И из выпадающего списка с именем 'Валюта' я выбираю точное значение "Рубли"
	И я нажимаю кнопку выбора у поля с именем 'Поставщик'
	Тогда открылось окно "Контрагенты"
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000012" | "Мосхлеб ОАО"  |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда открылось окно "Поступление товара (создание) *"
* Заполнение товарной части
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
	Тогда открылось окно "Товары"
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000011" | "Продукты"     |
	И в таблице 'Список' я перехожу на один уровень вниз
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000029" | "Хлеб"         |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда открылось окно "Поступление товара (создание) *"
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "10,00"
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыСумма'
	И в таблице 'Товары' я завершаю редактирование строки
* Проверка заполнения табличной части
	Тогда таблица 'Товары' содержит строки:
		| 'Товар' | 'Артикул' | 'Цена'  | 'Количество' | 'Сумма'  |
		| 'Хлеб'  | 'H987'    | '15,00' | '15,00'      | '150,00' |
* Запись документа
	И я нажимаю на кнопку "Записать"
* Номер
	И я запоминаю значение поля "Номер" как "$Номер$"	
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна "Поступление товара (создание) *" в течение 20 секунд
* Проверка создания документа
	И таблица "Список" содержит строки:
		| 'Номер' |
		| '$Номер$'   |
	
Сценарий: проверка наличия в справочнике Номенклатура элемента Торт
И В командном интерфейсе я выбираю "Продажи" "Товары"
Тогда открылось окно "Товары"
И я нажимаю на кнопку с именем 'ФормаСписок'
	И таблица "Список" содержит строки:
		| 'Наименование' |
		| 'Торт'   |
