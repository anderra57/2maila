
import nltk
import sys
import re
import io 
import os
from argparse import ArgumentParser
from glob import glob
####Argumentos######################################
p = ArgumentParser(description="python3 ../complejidadtextual.py files \"textos/*.doc.txt\" ")
p.add_argument("files", help="A glob pattern with files to process")
opts = p.parse_args()
ficheros = glob(opts.files)
print("Parametros: " + str(ficheros))


####Tokenizador
from nltk.tokenize import sent_tokenize, word_tokenize
#Bajar el tokenizador
nltk.download('punkt') 
not_punctuation = lambda w: not (len(w)==1 and (not w.isalpha()))

def get_word_count(text):
    word_count=0
    filterwords=filter(not_punctuation, word_tokenize(text))
    for word in filterwords:
        word_count=word_count+1
    return word_count
get_sent_count = lambda text: len(sent_tokenize(text))

#### Pronunciador- Utilizado para obtener silabas
# cmudict is a pronouncing dictionary for north american english words. 
# it splits words into phonemes, which are shorter than syllables.
# (e.g. the word 'cat' is split into three phonemes: K - AE - T). 
# but vowels also have a "stress marker": 
# either 0, 1, or 2, depending on the pronunciation of the word (so AE in 'cat' becomes AE1). 
# the code in the answer counts the stress markers and therefore the number of the vowels - 
# which effectively gives the number of syllables (notice how in OP's examples each syllable has exactly one vowel)
from nltk.corpus import cmudict
nltk.download('cmudict')
prondict = cmudict.dict()
def numsyllables(word):
    lista=[]
    maximoa=0
    for x in prondict[word.lower()]:
        #['HH', 'AH0', 'L', 'OW1']
        #print(x)
        listatmp=[]
        tmpmaximoa=0
        for y in x: 
            #print(y)
            if y[-1].isdigit():
                #print(y)
                tmpmaximoa=tmpmaximoa+1
                listatmp.append(y)
        lista.append(listatmp)
        if tmpmaximoa>maximoa:
            maximoa=tmpmaximoa
    #print(lista)
    #print(len(lista))
    return (maximoa)

def syllables(word):
    """
    Calculate syllables of a word using a less accurate algorithm.
    Parse through the sentence, using common syllabic identifiers to count
    syllables.
    
    ADAPTED FROM: 
    [http://stackoverflow.com/questions/14541303/count-the-number-of-syllables-in-a-word]
    """
    #initialize count
    count = 0
    #vowel list
    vowels = 'aeiouy'
    #take out punctuation
    word = word.lower() #word.lower().strip(".:;?!")
    #various signifiers of syllabic up or down count
    if word[0] in vowels:
        count +=1
    for index in range(1,len(word)):
        if word[index] in vowels and word[index-1] not in vowels:
            count +=1
    if word.endswith('e'):
        count -= 1
    if word.endswith('le') or word.endswith('a'):
        count+=1
    if count == 0:
        count +=1
    if "ooo" in word or "mm" in word :
        count = 1        
    if word == 'll':
        count = 0
    if (word.startswith('x') and len(word) >= 2) and word[1].isdigit():
        count = 0
    if word == 'lmfao':
        count = 5
    if len(word) < 2 and word not in ['a','i','y','o']:
        count = 0
    return count

def allnumsyllables(word):
    try:
        return numsyllables(word)
    except KeyError:
    #if word not found in cmudict
        return syllables(word)

def text_statistics(text):
    word_count = get_word_count(text)
    sent_count = get_sent_count(text)
    syllable_count = sum(map(lambda w: allnumsyllables(w), word_tokenize(text)))
    return word_count, sent_count, syllable_count

#It would be useful to go through an example of a word with more than one pronunciations, 
#such as prondict[‘orange’] gives:[[u'AO1', u'R', u'AH0', u'N', u'JH'], [u'AO1', u'R', u'IH0', u'N', u'JH']]
#For simplicity, if there are more than one pronunciations, 
#I take the largest number of syllables in subsequent calculations. 
flesch_formula = lambda word_count, sent_count, syllable_count : 206.835 - 1.015*word_count/sent_count - 84.6*syllable_count/word_count
def get_syllable_count(text):
	return (sum(map(lambda w: allnumsyllables(w), word_tokenize(text))))
def flesch(text):
  word_count, sent_count, syllable_count = text_statistics(text)
  return flesch_formula(word_count, sent_count, syllable_count)
 
fk_formula = lambda word_count, sent_count, syllable_count : 0.39 * word_count / sent_count + 11.8 * syllable_count / word_count - 15.59
def flesch_kincaid(text):
  word_count, sent_count, syllable_count = text_statistics(text)
  return fk_formula(word_count, sent_count, syllable_count)


for input in ficheros:
	sys.stderr.write("i Processing file " + os.path.basename(input) + "\n")	
	####input file##################
	outfile = os.path.basename(input)
	#input=sys.argv[1]
	####ouput files#################
	#estadisticos
	estadisticaoutput=input+".out.csv"
	#Write all the information in the file
	estfile = open(estadisticaoutput, "w")

	###############Tratamiento de texto###############################################
	#quitar todos los retornos \n si contiene
	text = open(input).read().replace('\n', '')
	#remove text inside parentheses
	#text = re.sub(r'\([^)]*\)', '', text)
	#separa , . ! ( ) ? ; del texto con espacios, teniendo en cuenta que los no son numeros en el caso de , y . 
	text = re.sub(r'[.]+(?![0-9])', r' . ', text)
	text = re.sub(r'[,]+(?![0-9])', r' , ', text)
	text = re.sub(r"!", " ! ", text)
	text = re.sub(r"\(", " ( ", text)
	text = re.sub(r"\)", " ) ", text)
	text = re.sub(r"\?", " ? ", text)
	text = re.sub(r";", " ; ", text)
	#sustituye 2 espacios seguidos por 1
	text = re.sub(r"\s{2,}", " ", text)


	######Informacion lectora- silabas
	#Flesch-Kincaid grade level =0.39 * (n.º de palabras/nº de frases) + 11.8 * (n.º de silabas/número de palabras) – 15.59)
	#Flesch readability ease=206.835-1.015(n.º de palabras/nº de frases)-84.6(n.º de silabas/número de palabras) 
	print('Number of syllables:'+str(get_syllable_count(text)))
	estfile.write("\n%s" % 'Number of syllables:'+str(get_syllable_count(text)))
	print("Flesch-Kincaid grade level:"+str(flesch_kincaid(text)))
	estfile.write("\n%s" % 'Flesch-Kincaid grade level:' + str(flesch_kincaid(text)))
	print("Flesch readability ease:"+str(flesch(text)))
	estfile.write("\n%s" % 'Flesch readability ease:' + str(flesch(text)))
	estfile.close()      
