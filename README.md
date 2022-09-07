# primex-hackathon-2022-09
Update for https://github.com/primex-finance/ETHWarsaw_2022

## Первая версия контракта: создание массива, тестовые транзакции, анализ

Берем оригинал контракта. Делаем легкие правки для onchain/offchain анализа.

Вот контракт
0xce36a4D2208Cf4Dd7fE32baA29cC7DA9b7137a69
транзакция создания
https://mumbai.polygonscan.com/tx/0x1f73b4ae87e6a8e6e14932192229f54d5c05e886811b35ec28f88f1e7d179d64
добавил логов, их всего 505
По нему видно у кого какой isClosable

Создался массив из 100 значений

Делаю выборку с 0 курсором 50 значений.
Вывод ограничивается _sizeLimit
Выбрал 10 значений

Попробовал closeElements меньше чем 10 значений, транзакция зафейлилась

сделал closeElements
4,6,7,9,12,15,16,17,19,22

транзакция здесь
https://mumbai.polygonscan.com/tx/0x8e293f13ed32a836b9865491caa9d48d6bc8c39144b80066ad65d193015c9454
Удалило эти 10
с 90 начало в обратном порядке добавлять, на места удаленных
При этом elementsId стало вместо 100 - 102
хотя вроде как не должно добавить
  id   uint256 :  99
  isClosable   bool :  false
Это типа как ошибка в контракте?
и elementLength стала 92

Не совсем понял как правильно курсор выставлять, его по идее можно тянуть и до 70-80, чтобы получить 10 элементов


Снова делаю getClosableElements
от _cursor 0 и _count 100
выдает  1,98,97,96,18,91,20,90,23,24

Кормлю в closeElements
https://mumbai.polygonscan.com/tx/0x2be5eea8ad35a37d59b6b55a7bf8f6f8f7b45dd36e3a0d33d8d09c6ac54877f4
elementsId 124 
elementLength 104
Видимо не ошибка

getClosableElements
теперь делаю
1,2,3,4,5,6,7,8,9,10
https://mumbai.polygonscan.com/tx/0x2616adbe9372294edcc7186499610b375972d3a1cf071814482aa37a3cdd3699
транзакция прошла
elementsId 125 
elementLength 104

## Вторая версия контракта: сокращение операции для кипера, перенос в контракт. Добавление просто защиты от лавинообразных транзакций

Меняем в closeElements входящие переменные с массива на курсор. Или нет, без параметров делаем и создаем cursorGlobal.

Делаем деплой
https://mumbai.polygonscan.com/address/0x29E83F173D29A2cdD61B9367B0739eF026082581#code

Массив из 100 элементов создан.
Он в файле contracts/ElementManager_v02.deploy.isClosable.txt

