from bs4 import BeautifulSoup
import requests
import settings
import json


def parse_html_to_json(html_content):
    """Парсинг HTML и конвертация данных в JSON по заданному шаблону."""
    soup = BeautifulSoup(html_content, 'html.parser')

    # Данные магазина
    shop_name = soup.select_one('meta[name="shop-name"]')
    company_name = soup.select_one('meta[name="company"]')
    shop_url = soup.select_one('meta[name="url"]')
    platform = "Custom"  # Можно заменить, если значение берется из HTML

    # Заполнение данных магазина
    shop_data = {
        "name": settings.name_shop,
        "company": settings.name_company,
        "url": settings.url_shop,
        "platform": platform,
        "categories": [],
        "offers": []
    }

    # Парсинг категорий (можно адаптировать при наличии дополнительных данных)
    categories = [{"id": 1, "name": "Мягкая мебель"}]  # Пример категории
    shop_data["categories"] = categories

    # Парсинг офферов (товаров)
    product_cards = soup.select('.card.card-mini')
    for card in product_cards:
        offer = {
            "id": card.get('data-product-id'),
            "available": True,
            "price": int(card.get('data-product-price', 0)),
            "currencyId": "RUB",
            "categoryId": 1,  # Можно изменить, если категория динамическая
            "name": card.get('data-product-name'),
            "params": {
                "quantity": int(card.get('data-product-quantity', 0))
            }
        }
        shop_data["offers"].append(offer)

    return {"shop": shop_data}


# Пример HTML (вставьте ваш HTML сюда)
html_example = requests.get(settings.url).content


def run():
    # Парсинг HTML
    json_data = parse_html_to_json(html_example)
    # Вывод JSON
    with open('xml_input.json', 'w') as f:
        json.dump(json_data, f, indent=4, ensure_ascii=False)
