from owlready2 import *

onto = get_ontology("file://myowl.owl").load()

def recommend_gadget():
    actor = input("Предпочитаемый актёр (Степан/Мариарти): ") or None
    genre = input("Предпочитаемый жанр (Комедия/Ужасы): ") or None
    director = input("Предпочитаемый режиссёр (Джо_Байден/Френк_Синатра): ") or None
    
    recommended_film = None
    for film in onto.Фильм.instances():
        matches = True
        if actor:
            actors = [str(b.name) for b in film.имеетАктёра] 
            if actor not in actors:
                matches = False
        if genre:
            genres = [str(t.name) for t in film.имеетЖанр] 
            if genre not in genres:
                matches = False
        if director:
            directors = [str(p.name) for p in film.имеетРежиссёра]
            if director not in directors:
                matches = False
        if matches:
            recommended_film = film.name
            break  
    

    if recommended_film:
        print(f"\nНа основе ваших предпочтений я рекомендую вам фильм: {recommended_film}")
    else:
        print("\nТаких фильмов нет")

if __name__ == "__main__":
    recommend_gadget()