# Viswajith V (CS11B028) - 3rd year, B.Tech
# Sriram V (CS11B058) - 3rd year, B.Tech

import subprocess
import xml.etree.ElementTree as ET
import sys


# Global vars
CANDC_LOC = '/run/media/sriram/8163f884-43b4-46a5-b61d-3a274dcd690a/sriram/Downloads/candc-1.00/bin/candc'
MODELS_LOC = '/run/media/sriram/8163f884-43b4-46a5-b61d-3a274dcd690a/sriram/Downloads/models'


class Predicate:
    def __init__ (self, attrib):
        self.attrib = attrib
        self.name = attrib['word']
        self.lemma = attrib['lemma']
        # Defining lambda expression formats for various CCG categories
        if(attrib['cat']=='(S\NP)/NP'):
            self.lmbd = [1,0]
            self.args = [None,None]
        elif(attrib['cat']=='S\NP'):
            self.lmbd = [0]
            self.args = [None]
        elif(attrib['cat']=='NP'):
            self.lmbd = []
            self.args = []
        elif(attrib['cat']=='S/NP'):
            self.lmbd = [0]
            self.args = [None]
        elif(attrib['cat']=='conj'):
            self.lmbd = [1,0]
            self.args = [None, None]
        else:
            self.lmbd = []
            self.args = []

    def combine(self, other):
        """Used to combine two child lambda expressions in the parent node"""
        self.args[self.lmbd[0]] = other.attrib
        self.lmbd = self.lmbd[1:]
        if(self.attrib['cat']=='conj' and len(self.lmbd)==0):
            self.name = self.args[0]['word'] + ' ' + self.name + ' ' + self.args[1]['word']
            self.attrib['cat'] = 'conj'
            self.attrib['word'] = self.name
            self.attrib['lemma'] = self.name
            self.attrib['pos'] = 'NN'
            self.attrib['args'] = self.args

    def printunary (self):
        """Prints unary predicates, which are specified using a form of the word be."""
        if self.attrib['word'] == 'is':
            print self.args[1]['word'] + '(' + self.args[0]['word'] + ')'
        if self.attrib['word'] == 'are':
            print 'Forall x [' + self.args[0]['lemma'] + '(x) --> ' +  self.args[1]['word'] + '(x)]'


    def printsingularsubject(self):
        """Prints binary predicates with a singular subject."""
        if not len(self.args) == 2:
            print 'printsingularsubject error: Not a binary predicate'
            return

        #Index for quantifiers
        quant_index = 1
        quantifier = []
        firstbit = []


        op = [self.name, '(']
        op2 = [self.name, '(']

        #For singular noun objects.
        if self.args[1]['pos'] == 'NNP' or self.args[1]['pos'] == 'NN':

            for x in self.args:
                #Proper noun.
                if x['pos'] == 'NNP':
                    op.append(x['word'])
                    op2.append(x['word'])
                else: #Common noun.
                    if(x['cat']=='conj'):
                        op.append('x' + str(quant_index))
                        firstbit.append(x['args'][0]['lemma'] + '(x' + str(quant_index) + ') and ')
                        quantifier.append('There_exists x' + str(quant_index) + ' ')
                        quant_index = quant_index + 1

                        op2.append('x' + str(quant_index))
                        firstbit.append(x['args'][1]['lemma'] + '(x' + str(quant_index) + ') and ')
                        quantifier.append('There_exists x' + str(quant_index) + ' ')
                        quant_index = quant_index + 1
                    else:
                        op.append('x' + str(quant_index))
                        op2.append('x' + str(quant_index))
                        firstbit.append(x['lemma'] + '(x' + str(quant_index) + ') and ')
                        quantifier.append('There_exists x' + str(quant_index) + ' ')
                        quant_index = quant_index + 1

                op.append(',')
                op2.append(',')
            op = op[:-1] #To remove trailing comma.
            op2 = op2[:-1] #To remove trailing comma.
            op.append(')')
            op2.append(')')
            for x in self.args:
                if(x['cat']=='conj'):
                    op = [''.join(op) + ' ' + x['lemma'].split()[1] + ' ' + ''.join(op2)]
        #For plural noun objects.
        if self.args[1]['pos'] == 'NNS' or self.args[1]['pos'] == 'NNPS':

            #Proper noun
            if self.args[0]['pos'] == 'NNP':
                op.append(self.args[0]['word'])
                op2.append(self.args[0]['word'])
            else: #Common noun.
                op.append('x'+str(quant_index))
                op2.append('x' + str(quant_index))
                firstbit.append(self.args[0]['lemma'] + '(x' + str(quant_index) + ') and ')
                quantifier.append('There_exists x' + str(quant_index)+ ' ')
                quant_index = quant_index + 1
            op.append(',')
            op2.append(',')

            quantifier.append('For_all x' + str(quant_index) + ' ')
            op.append('x' + str(quant_index) + ')')
            op2.append('x' + str(quant_index) + ')')
            firstbit.append(self.args[1]['lemma']+'(x' + str(quant_index) + ') --> ')


        print ''.join(quantifier), ''.join(firstbit), ''.join(op)

    def printpluralsubject(self):
        """Prints binary predicates with plural subjects."""
        #For singular proper noun object.
        if self.args[1]['pos'] == 'NNP':
            print 'For_all x [' + self.args[0]['lemma'] + '(x) --> ' +  self.attrib['word'] + '(x, ' + self.args[1]['word'] + ')]'

        #For singular common noun object.
        if self.args[1]['pos'] == 'NN' or self.args[1]['pos'] == 'JJ':
            if(self.args[1]['cat']=='conj'):
                print 'There_exists x1 ' + self.args[1]['args'][0]['word'] + '(x1) and There_exists x2 ' + self.args[1]['args'][1]['word'] + '(x2) For_all x3 ' + self.args[0]['lemma'] + '(x3) --> ' + self.attrib['word'] + '(x3, x1)' + ' ' + self.args[1]['lemma'].split()[1] + ' ' + self.attrib['word'] + '(x3, x2)'
            else:
                print 'There_exists x1 ' + self.args[1]['word'] + '(x1) and For_all x2 ' + self.args[0]['lemma'] + '(x2) --> ' + self.attrib['word'] + '(x2, x1)'
        #For plural noun objects.
        if self.args[1]['pos'] == 'NNS' or self.args[1]['pos'] == 'NNPS':
            print 'For_all x1 For_all x2 ' + self.args[0]['lemma'] + '(x1) and ' + self.args[1]['lemma'] + '(x2) --> ' + self.attrib['word'] + '(x1, x2)'


    def prettyPrint(self):
        """Convert the final predicate class into a printable expression"""
        #To handle Unary Predicates, which are specified using a form of the word be.
        if self.attrib['lemma'] == 'be':
            self.printunary()
        else:
            if self.args[0]['pos'] == 'NN' or self.args[0]['pos'] == 'NNP':
                self.printsingularsubject()
            if self.args[0]['pos'] == 'NNS' or self.args[0]['pos'] == 'NNPS':
                self.printpluralsubject()


def stripSqBkts(root):
    """Strip excess detail returned by candc"""
    cat = []
    skip = False
    if root != None:
        for child in root:
            child = stripSqBkts(child)
        for c in root.attrib['cat']:
            if(c=='['):
                skip = True
            elif(c==']'):
                skip = False
                continue
            if(skip==False):
                cat.append(c)
        root.attrib['cat'] = ''.join(cat)
    return root


def postorder(root):
    """Postorder traversal of the binary parse tree generated by candc to evaluate the sentence"""
    retval = []
    if root != None:
        for child in root:
            retval.append(postorder(child))
        if(root.tag=='lf'):
            lmb_exp = Predicate(root.attrib)
        elif(len(retval)==2):
            if(len(retval[0].lmbd)==0):
                retval[1].combine(retval[0])
                lmb_exp = retval[1]
            elif(len(retval[1].lmbd)==0):
                if(retval[1].lemma=='JJ'):
                    lmb_exp = retval[1]
                else:
                    retval[0].combine(retval[1])
                    lmb_exp = retval[0]
        else:
            lmb_exp = retval[0]
    return lmb_exp


def main(argv):
    """The main function, called only if the program is executed as a script and not imported"""
    args = (CANDC_LOC + ' --models ' + MODELS_LOC + ' --log /dev/null --candc-printer xml').split()
    sentences = []
    flag = 'y'
    print 'Enter sentence:'
    while flag=='y':
        sentences.append(sys.stdin.readline())
        print 'Enter more? (y/n)'
        flag = sys.stdin.readline()
        flag = flag[:-1]
        if(flag=='n'):
            break

    print 'Processing...'
    for ip_line in sentences:
        ip_line = ip_line.split()
        ip_line = [x for x in ip_line if (x.lower()!='a' and x.lower()!='an' and x.lower()!='the' and x.lower()!='all' and x.lower()!='some')]
        ip_line  = ' '.join(ip_line)
        ip_line = ip_line+'\n'

        # Call a subprocess to invoke candc
        p = subprocess.Popen(args, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
        output = p.communicate(ip_line)[0]
        # Parse returned xml file into a tree
        root = ET.fromstring(output)[0][0]
        root = stripSqBkts(root)
        final = postorder(root)
        final.prettyPrint()

if __name__ == '__main__':
    main(sys.argv)
