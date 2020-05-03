# определение переменных
@humans   = 10000
@machines = 10000

# вспомогательные методы
def luck?
  rand(0..1) == 1
end

def boom
  diff = rand(1..5)
  if luck?
    @machines -= diff
    puts "#{diff} машин уничтожено"
  else
    @humans -= diff
    puts "#{diff} людей погибло"
  end
end

def random_city
  dice = rand(1..5)
  case dice
    when 1
      "Москва"
    when 2
      "Лос-Анжелес"
    when 3
      "Пекин"
    when 4
      "Лондон"
    when 5
      "Сеул"
  end

end
def random_sleep
  sleep rand(0.3..1.5)
end
def stats
  puts "Осталось #{@humans} людей и #{@machines} машин"
end
# события
def event1
  puts "Запущена ракета по городу #{random_city}"
  random_sleep
  boom
end
def event2
  puts "Применено радиоактивное оружие в городе #{random_city}"
  random_sleep
  boom
end
def event3
  puts "Группа солдат прорывает оборону противника в городе #{random_city}"
  random_sleep
  boom
end
# проверка победы
def check_victory?
  if @humans <= 0
    puts "=" * 50
    puts "Машины победили"
    puts "=" * 50
    exit
  elsif @machines <= 0
    puts "=" * 50
    puts "Люди победили!!!"
    puts "=" * 50
    exit
  end

end
# цикл главный
loop do
  if check_victory?
    exit
  end

  dice = rand(1..3)

  case dice
    when 1
      event1
    when 2
      event2
    when 3
      event3
  end

  stats
  random_sleep


end
