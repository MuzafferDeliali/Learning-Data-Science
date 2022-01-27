## Key value pairing

# How to peer
MyDictionary ={"key_word" : "value"}
type(MyDictionary) # type dict
MyDictionary["key_word"] # returns "value"

# How asign new value and replace it
MyDictionary["key_word"] = "password" # new value is "password"
MyDictionary # now it will return password
# we can nest Dictionaries just like we nested lists
alphabet = {"a" : 1, "b" : 2, "c" : 3, "credits" : {"credit1" : [4,5,6]}}

alphabet.keys()   # it will return our key words
alphabet.values() # it will return our values

alphabet["credits"]["credit1"] # calls credits1 dict
alphabet["credits"]["credit1"][-1] # calls last value of credit1 dict    