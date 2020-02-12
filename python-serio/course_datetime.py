def shorten(string_list):
    length = len(string_list[0])
    for s in string_list:
        length = yield s[:length]


mystringlist = ['loremipsum', 'dolorsit', 'ametfoobar']
shortstringlist = shorten(mystringlist)
result = []
try:
    s = next(shortstringlist)
    result.append(s)
    while True:
        number_of_vowels = len(filter(lambda letter: letter in 'aeiou', s))
        s = shortstringlist.send(number_of_vowels)
        result.append(s)
except StopIteration:
    print("developer end genrator")


def add_animal_in_family(species, animal, family):
    if family not in species:
        species[family] = set()
    species[family].add(animal)

species = {}
add_animal_in_family(species, 'cat', 'felidea')
