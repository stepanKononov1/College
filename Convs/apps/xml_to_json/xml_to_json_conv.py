import xml.etree.ElementTree as ET
from os.path import sep
import json


def xml_to_json(xml_file):
    tree = ET.parse(xml_file)
    root = tree.getroot()

    def parse_element(element):
        parsed_data = {}
        offers_list = []

        for child in element:
            if child.tag == "offer":
                offers_list.append(parse_element(child))
            else:
                parsed_data[child.tag] = parse_element(child) if len(
                    child) > 0 else child.text if child.text else ""

        if offers_list:
            return offers_list

        return parsed_data

    shop_data = parse_element(root.find("shop"))
    offers = shop_data.pop("offers", [])
    json_data = {"shop": shop_data, "offers": offers}

    return json_data


def run():
    xml_file = "xml_output.xml"
    json_output = xml_to_json(xml_file)
    with open(f"apps{sep}xml_to_json{sep}json_output.json", "w", encoding="utf-8") as file:
        json.dump(json_output, file, indent=4, ensure_ascii=False)


if __name__ == "__main__":
    run()
