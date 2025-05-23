﻿#language: ru

@tree

Функционал: Создание документа Заказ

Как Менеджер по продажам я хочу
создать документ Заказ 
чтобы продать товар покупателю   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Создание документа Заказ

* Открытие формы создания документа
	И В командном интерфейсе я выбираю "Продажи" "Заказы"
	Тогда открылось окно "Заказы товаров"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно "Заказ (создание)"
* Заполнение шапки документа
	И из выпадающего списка с именем 'Организация' я выбираю точное значение "ООО \"1000 мелочей\""
	И из выпадающего списка с именем 'Покупатель' я выбираю точное значение "Магазин \"Продукты\""
	И из выпадающего списка с именем 'Склад' я выбираю точное значение "Склад отдела продаж"
* Заполнение табличной части
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
	Тогда открылось окно "Товары"
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000011" | "Продукты"     |
	И в таблице 'Список' я перехожу на один уровень вниз
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000030" | "Колбаса"      |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Заказ (создание) *"
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "3"
	И я перехожу к следующему реквизиту
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыТовар'
	И в таблице 'Товары' я завершаю редактирование строки
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
	Тогда открылось окно "Товары"
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000011" | "Продукты"     |
	И в таблице 'Список' я перехожу на один уровень вниз
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000032" | "Торт "        |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Заказ (создание) *"
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыЦена'
	И в таблице 'Товары' в поле с именем 'ТоварыЦена' я ввожу текст "1 000,00"
	И я перехожу к следующему реквизиту
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "2"
	И я перехожу к следующему реквизиту
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыЦена'
	И в таблице 'Товары' я завершаю редактирование строки
* Запись документа
	И я нажимаю на кнопку "Записать"
* Номер
	И я запоминаю значение поля "Номер" как "$Номер$"	
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна "Заказ (создание) *" в течение 20 секунд
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
		| 'Колбаса'   |	
	И таблица "Список" содержит строки:
		| 'Наименование' |
		| 'Торт'   |	
