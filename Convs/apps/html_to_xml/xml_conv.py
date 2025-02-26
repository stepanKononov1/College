import xml.etree.ElementTree as ET
from datetime import datetime
import json


def dict_to_yml_catalog(data):
    # Создаем корневой элемент
    yml_catalog = ET.Element("yml_catalog", date=datetime.now().isoformat())

    # Элемент shop
    shop = ET.SubElement(yml_catalog, "shop")
    for key, value in data["shop"].items():
        if key == "categories":
            categories = ET.SubElement(shop, "categories")
            for category in value:
                category_element = ET.SubElement(
                    categories, "category", id=str(category["id"]))
                category_element.text = category["name"]
        elif key == "offers":
            offers = ET.SubElement(shop, "offers")
            for offer in value:
                offer_element = ET.SubElement(
                    offers, "offer", id=offer["id"], available=str(offer["available"]).lower())
                for offer_key, offer_value in offer.items():
                    if offer_key in ["id", "available"]:
                        continue
                    elif offer_key == "params":
                        for param_name, param_value in offer_value.items():
                            param = ET.SubElement(
                                offer_element, "param", name=param_name)
                            param.text = str(param_value)
                    else:
                        child = ET.SubElement(offer_element, offer_key)
                        child.text = str(offer_value)
        else:
            child = ET.SubElement(shop, key)
            child.text = str(value)

    return ET.tostring(yml_catalog, encoding="unicode", xml_declaration=True)


def run():
    with open('xml_input.json', 'r') as file:
        data = json.load(file)
    xml_output = dict_to_yml_catalog(data)
    with open("xml_output.xml", "w", encoding="utf-8") as file:
        file.write(xml_output)
