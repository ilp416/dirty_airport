# Взлетная полоса

>Есть аэропорт с одной взлетной полосой. Диспетчеру предоставляется интерфейс позволяющий отправить самолет на взлет. Интерфейс позволяет отправлять несколько самолетов на взлет одновременно. Сам взлет занимает 10+ секунд. Интерфейс отображает текущий статус самолета (вылетел и тд), а также историю изменения статуса. Используйте Ruby 2.2.2, Rails 3/4 и MySQL. Запускаться будет под debian и Mac OS.

Это решение задачи "В лоб". Используется sidekiq и redis. Самолеты ставятся в очередь, которая обрабатывает только один процесс одновременно.


