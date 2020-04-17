# instalando lo necesario
lang_type<las capacidades del model>_genero<las funtes desde donde fue entrenado el model>_size<sm,md,lm>
pip3 install spacy
python -m spacy download en_core_web_md

# casos especiales de lemiizacion
En  la vida real existen casos espciales de palabras, llamemolas palavbras coloquiales el nlp de spacy no las puede
reconocer pero onosotros podemos indicarles esos casos
especiles

```python
import spacy
from spacy.symbols import ORTH, LEMMA

nlp = spacy.load("model")
# antes de agregar casos especiales
doc = nlp("Yo me voy para frisco")
print([w.text for w in doc])
#
# agragando casos especiales
special_case = [{ORTH:u"Frisco",LEMMA:u"San Franciso"}}]
nlp.tokenizer.add_special_case(u"Frisco",special_case)

print([w.lemma_ for w in nlp(u"Me voy a Frisco")])

```
### recurso de las etiquetas,como si es verbo , singular, primera persona, 2 persona
https://spacy.io/api/annotation#pos-tagging

los elemntos de grano fino tienen el attr .<tag_> y los de grano grueso <pos_>

# uba etiqueta de dependencias sintactica describe la relacion sibntantica entre dos palabras
consta de una cabeza y un hijo, cada hijo tiene asignado una tag de dependencia (por depende de la cabez)

un elemento que tienee la etiqueta root , significa que el una parte principal de la oracion y que el mismo es la 
cabeza
en cada oraciondebe haber una etiqueta ROOT y nsubj(sujeto)solo y solo es una oracion completa
se pude acceder atravez de sus atributo <Token.dep_>
> para triturar un texto(o dividirlo en sus respectivas oraciones) utilizamos el atributo sents del token object
que retorna el nlp

```python
impor spacy
nlp = spaxy.load("model")
doc = nlp("He volado LA. Ahora estoy volando a San Franciso")

for sent in doc.sents:
    print([w.text for w in sent id w.dep_ == "ROOT" or w.dep_ == "pobj"])
```
# entidades nombradas
se puede accder a su tipo desde el atributo  <token.ent_type> retorna el tipo de entidad que , tipo persona, pais,cuidad
# cap3
# trabajar con objetos contenedores

