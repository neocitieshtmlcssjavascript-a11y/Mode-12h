-- Конфигурация состояний игрока
local PlayerState = {
    CurrentWeapon = "None", -- Текущее оружие
    IsRunning = false,      -- Флаг бега
    Health = 100,           -- Здоровье
    MaxHealth = 100
}

-- БАЗОВЫЕ КОМАНДЫ (1-4)

-- 1. Меч (Sword)
local function equipSword()
    PlayerState.CurrentWeapon = "Sword"
    print("[⚔️] Меч экипирован! Готов к ближнему бою.")
end

-- 2. Огнестрел (Gun)
local function equipGun()
    PlayerState.CurrentWeapon = "Gun"
    print("[🔫] Оружие экипировано! Готов к дальнему бою.")
end

-- 3. Бег (Run)
local function toggleRun()
    PlayerState.IsRunning = not PlayerState.IsRunning
    local speedStatus = PlayerState.IsRunning and "Ускорение активировано!" or "Обычный шаг."
    print("[🏃] Бег: " .. speedStatus)
end

-- 4. Взаимодействие с блоками (Blox)
local function interactWithBlox()
    print("[📦] Взаимодействие с Blox: Строительство / Разрушение объекта.")
end


-- БОЕВЫЕ СПСОБНОСТИ И ДЕЙСТВИЯ (5-9)

-- 5. Способность Q (Рывок / Быстрая атака)
local function useAbilityQ()
    if PlayerState.CurrentWeapon == "Sword" then
        print("[⚡ Q] Меч: Стремительный выпад вперед!")
    elseif PlayerState.CurrentWeapon == "Gun" then
        print("[⚡ Q] Оружие: Быстрый выстрел навскидку!")
    else
        print("[⚡ Q] Способность Q: Уклонение (оружие не выбрано).")
    end
end

-- 6. Способность E (Сильный удар / Перезарядка)
local function useAbilityE()
    if PlayerState.CurrentWeapon == "Sword" then
        print("[💥 E] Меч: Круговой рассекающий удар!")
    elseif PlayerState.CurrentWeapon == "Gun" then
        print("[💥 E] Оружие: Перезарядка обоймы.")
    else
        print("[💥 E] Действие E: Осмотреться.")
    end
end

-- 7. Способность T (Ультимейт / Бросок)
local function useAbilityT()
    print("[🔥 T] Активация Ультимативной способности Т!")
end

-- 8. Способность 8F (Супер-комбо / Фаталити)
local function useAbility8F()
    print("[💀 8F] Комбо-финишер 8F: Нанесение критического урона!")
end

-- 9. Лечение на лугу (Medws / Meadows / Медицина)
local function useMedws()
    if PlayerState.Health < PlayerState.MaxHealth then
        PlayerState.Health = math.min(PlayerState.MaxHealth, PlayerState.Health + 25)
        print("[🏥 Medws] Исцеление! Здоровье восстановлено до: " .. PlayerState.Health)
    else
        print("[🏥 Medws] Здоровье уже на максимуме.")
    end
end


-- ОБРАБОТЧИК ВВОДА (Эмуляция нажатия клавиш)
-- Передайте строку-команду для симуляции действия
local function handleInput(key)
    if key == "1" then equipSword()
    elseif key == "2" then equipGun()
    elseif key == "3" then toggleRun()
    elseif key == "4" then interactWithBlox()
    elseif key == "5" or key:lower() == "q" then useAbilityQ()
    elseif key == "6" or key:lower() == "e" then useAbilityE()
    elseif key == "7" or key:lower() == "t" then useAbilityT()
    elseif key == "8f" or key:lower() == "8f" then useAbility8F()
    elseif key == "9" or key:lower() == "medws" then useMedws()
    else
        print("[❓] Неизвестная команда: " .. tostring(key))
    end
end

-- ==========================================
-- ТЕСТОВЫЙ ЗАПУСК СЦЕНАРИЯ ИГРЫ (Имитация действий игрока)
-- ==========================================
print("--- СТАРТ ИГРЫ ---")
handleInput("1")      -- Взяли меч
handleInput("3")      -- Включили бег
handleInput("q")      -- Ударили мечом через Q
handleInput("2")      -- Переключились на пушку
handleInput("e")      -- Перезарядились через E
handleInput("8f")     -- Прожали ульту 8F
handleInput("medws")  -- Полечились
