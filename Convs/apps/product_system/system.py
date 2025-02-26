import datetime

# Продукционные правила для системы скидок


def apply_discount(purchase_amount, customer_status, purchase_frequency, is_holiday, is_promotion):
    discount = 0

    # Правило 1: Если сумма покупки больше 5000, то скидка 10%
    if purchase_amount > 5000:
        discount = max(discount, 10)

    # Правило 2: Если клиент имеет статус "постоянный", то скидка 5%
    if customer_status == "постоянный":
        discount = max(discount, 5)

    # Правило 3: Если частота покупок больше 3 раз в месяц, то скидка 15%
    if purchase_frequency > 3:
        discount = max(discount, 15)

    # Правило 4: Если покупка совершается в праздничный день, то скидка 20%
    if is_holiday:
        discount = max(discount, 20)

    # Правило 5: Если активна акция на товар, то скидка 25%
    if is_promotion:
        discount = max(discount, 25)

    return discount


# Ввод данных от пользователя
def get_input():
    print("Введите сумму покупки:")
    purchase_amount = float(input())

    print("Введите статус клиента (новый/постоянный):")
    customer_status = input().strip().lower()

    print("Введите частоту покупок (в месяц):")
    purchase_frequency = int(input())

    print("Является ли сегодня праздничным днем? (yes/no):")
    is_holiday = input().strip().lower() == "yes"

    print("Есть ли акция на товар? (yes/no):")
    is_promotion = input().strip().lower() == "yes"

    return purchase_amount, customer_status, purchase_frequency, is_holiday, is_promotion


# Основная функция программы
def main():
    # Получаем входные данные от пользователя
    purchase_amount, customer_status, purchase_frequency, is_holiday, is_promotion = get_input()

    # Применяем продукционные правила
    discount = apply_discount(
        purchase_amount, customer_status, purchase_frequency, is_holiday, is_promotion)

    # Выводим результат
    print(f"Применяемая скидка: {discount}%")

    # Расчет итоговой стоимости с учетом скидки
    final_price = purchase_amount * (1 - discount / 100)
    print(f"Итоговая стоимость после скидки: {final_price:.2f} руб.")


# Запуск программы
if __name__ == "__main__":
    main()
