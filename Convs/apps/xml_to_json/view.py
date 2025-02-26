import random
import matplotlib.pyplot as plt
import json
import os

# Замените на правильный путь к вашему файлу
file_path = os.path.join('apps', 'xml_to_json', 'json_output.json')

# Открытие файла и чтение данных
with open(file_path, 'r', encoding='utf-8') as f:
    json_data = json.load(f)  # Загружаем данные из файла как Python-словарь

# Извлекаем только офферы
offers = json_data['offers']

# Генерация случайных значений продаж для каждого оффера
# Генерация случайного числа продаж от 1 до 100 для каждого оффера
sales = [random.randint(1, 100) for _ in offers]
offer_names = [offer['name'] for offer in offers]

# Построение графика
plt.figure(figsize=(10, 6))
plt.barh(offer_names, sales, color='skyblue')
plt.xlabel('Продажи')
plt.title('Продажи товаров')
plt.grid(True)

# Сохранение графика в файл
output_file = os.path.join('apps', 'xml_to_json', 'output_view.png')
plt.savefig(output_file)

# Сообщение, что график сохранен
print(f"График сохранен как {output_file}")
