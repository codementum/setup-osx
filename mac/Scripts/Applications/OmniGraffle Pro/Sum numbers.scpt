FasdUAS 1.101.10   ��   ��    k             p         ������ 0 total_object_tag  ��      	  l     
�� 
 r         m         -- Total Holder     o      ���� 0 total_object_tag  ��   	     p         ������ 0 	total_obj  ��        l    ��  r        m    ��
�� boovfals  o      ���� 0 	total_obj  ��        l     ������  ��        i         I      �� ���� 0 sum_numbers     ��  o      ���� 0 some_objects  ��  ��    k     {        r      ! " ! m     ����   " o      ���� 0 running_total      # $ # X    x %�� & % k    s ' '  ( ) ( r     * + * n     , - , m    ��
�� 
ctxt - o    ���� 0 obj   + o      ���� 0 obj_text   )  .�� . Z    s / 0���� / >    1 2 1 o    ���� 0 obj_text   2 m     3 3       0 k     o 4 4  5 6 5 r     % 7 8 7 n     # 9 : 9 1   ! #��
�� 
pALL : o     !���� 0 obj   8 o      ���� 0 	obj_props   6  ;�� ; Z   & o < =�� > < C  & + ? @ ? n   & ) A B A m   ' )��
�� 
scpt B o   & '���� 0 	obj_props   @ o   ) *���� 0 total_object_tag   = r   . 1 C D C o   . /���� 0 obj   D o      ���� 0 	total_obj  ��   > Q   4 o E F G E k   7 ` H H  I J I l  7 7�� K��   K = 7set running_total to running_total + (obj_text as real)    J  L M L r   7 B N O N l  7 @ P�� P I  7 @�� Q��
�� .sysoexecTEXT���     TEXT Q b   7 < R S R b   7 : T U T m   7 8 V V  echo '    U o   8 9���� 0 obj_text   S m   : ; W W V P'| ruby -e 'puts STDIN.readlines.join('' '').scan(/-?[0-9]+(?:\.[0-9]+)?/).last'   ��  ��   O o      ���� 0 found_number   M  X Y X I  C H�� Z��
�� .ascrcmnt****      � **** Z o   C D���� 0 found_number  ��   Y  [ \ [ l  I I�� ]��   ] 0 *if (found_numbers is not equal to "") then    \  ^ _ ^ l  I I�� `��   ` # 	log "Found " & found_numbers    _  a b a l  I I�� c��   c  end if    b  d e d l  I I�� f��   f 3 -set last_number to last word of found_numbers    e  g h g r   I P i j i [   I N k l k o   I J���� 0 running_total   l l  J M m�� m c   J M n o n o   J K���� 0 found_number   o m   K L��
�� 
doub��   j o      ���� 0 running_total   h  p q p I  Q X�� r��
�� .ascrcmnt****      � **** r b   Q T s t s m   Q R u u  Last:     t o   R S���� 0 found_number  ��   q  v�� v I  Y `�� w��
�� .ascrcmnt****      � **** w b   Y \ x y x m   Y Z z z  Total:     y o   Z [���� 0 running_total  ��  ��   F R      ���� {
�� .ascrerr ****      � ****��   { �� | }
�� 
erob | o      ���� 0 
not_a_real   } �� ~��
�� 
errt ~ m      ��
�� 
doub��   G I  h o�� ��
�� .ascrcmnt****      � ****  m   h k � � D >Can't find something to convert  to real. Nothing to see here.   ��  ��  ��  ��  ��  �� 0 obj   & o    ���� 0 some_objects   $  ��� � L   y { � � o   y z���� 0 running_total  ��     � � � l     ������  ��   �  ��� � l   � ��� � O    � � � � k    � � �  � � � I   ������
�� .miscactvnull��� ��� null��  ��   �  � � � r     � � � 1    ��
�� 
sele � o      ���� 0 selected_stuff   �  � � � Z    8 � ��� � � ?      � � � n     � � � 1    ��
�� 
leng � o    ���� 0 selected_stuff   � m    ����   � r   # + � � � n  # ) � � � I   $ )�� ����� 0 sum_numbers   �  ��� � o   $ %���� 0 selected_stuff  ��  ��   �  f   # $ � o      ���� 	0 total  ��   � r   . 8 � � � n  . 6 � � � I   / 6�� ����� 0 sum_numbers   �  ��� � 2  / 2��
�� 
OGGr��  ��   �  f   . / � o      ���� 	0 total   �  � � � Z   9 w � ����� � =  9 < � � � o   9 :���� 0 	total_obj   � m   : ;��
�� boovfals � l  ? s � � � X   ? s ��� � � k   Q n � �  � � � r   Q X � � � n   Q T � � � 1   R T��
�� 
pALL � o   Q R���� 0 obj   � o      ���� 0 	obj_props   �  ��� � Z   Y n � ����� � =  Y b � � � n   Y ` � � � m   \ `��
�� 
scpt � o   Y \���� 0 	obj_props   � o   ` a���� 0 total_object_tag   � k   e j � �  � � � r   e h � � � o   e f���� 0 obj   � o      ���� 0 	total_obj   �  ��� �  S   i j��  ��  ��  ��  �� 0 obj   � 2  B E��
�� 
OGGr � ' ! Check everything else for holder   ��  ��   �  ��� � Z   x � � ��� � � =  x { � � � o   x y���� 0 	total_obj   � m   y z��
�� boovfals � l  ~ � � � � I  ~ ����� �
�� .corecrel****      � null��   � �� � �
�� 
kocl � m   � ���
�� 
OGSh � �� � �
�� 
insh � n   � � � � �  ;   � � � 2  � ���
�� 
OGGr � �� ���
�� 
prdt � K   � � � � �� � �
�� 
ctxt � K   � � � � �� � �
�� 
font � m   � � � �  GillSans-Bold    � � � �
� 
OTta � m   � ��~
�~ OTtaOTa1 � �} ��|
�} 
ctxt � c   � � � � � o   � ��{�{ 	0 total   � m   � ��z
�z 
TEXT�|   � �y � �
�y 
Ogth � m   � ��x�x  � �w � �
�w 
Ogcr � m   � ��v�v  � �u � �
�u 
Ogds � m   � ��t
�t boovfals � �s � �
�s 
Ogor � J   � � � �  � � � m   � ��r�r d �  ��q � m   � ��p�p d�q   � �o � �
�o 
ptsz � J   � � � �  � � � m   � ��n�n ( �  ��m � m   � ��l�l �m   � �k ��j
�k 
scpt � o   � ��i�i 0 total_object_tag  �j  ��   � &   Still not there, make a new one   ��   � r   � � � � � c   � � � � � o   � ��h�h 	0 total   � m   � ��g
�g 
TEXT � n       � � � m   � ��f
�f 
ctxt � o   � ��e�e 0 	total_obj  ��   � n     � � � 4  	 �d �
�d 
cwin � m   
 �c�c  � m    	 � ��null      ߀�� QOmniGraffle.app  �̙����ؐ   ��������ؐ����u�  .���   OGfl   alis    T  Dorkbase                   �J�QH+   QOmniGraffle.app                                                 ���            ����  	                Applications    �J�A               Q  %Dorkbase:Applications:OmniGraffle.app      O m n i G r a f f l e . a p p    D o r k b a s e  Applications/OmniGraffle.app  / ��  ��  ��       
�b � � �  � �a�`�b   � �_�^�]�\�[�Z�Y�X�_ 0 sum_numbers  
�^ .aevtoappnull  �   � ****�] 0 total_object_tag  �\ 0 	total_obj  �[ 0 selected_stuff  �Z 	0 total  �Y  �X   � �W �V�U�T�W 0 sum_numbers  �V �S�S   �R�R 0 some_objects  �U   �Q�P�O�N�M�L�K�Q 0 some_objects  �P 0 running_total  �O 0 obj  �N 0 obj_text  �M 0 	obj_props  �L 0 found_number  �K 0 
not_a_real   �J�I�H�G 3�F�E�D�C V W�B�A�@ u z�? �
�J 
kocl
�I 
cobj
�H .corecnte****       ****
�G 
ctxt
�F 
pALL
�E 
scpt�D 0 total_object_tag  �C 0 	total_obj  
�B .sysoexecTEXT���     TEXT
�A .ascrcmnt****      � ****
�@ 
doub�?   �>�=
�> 
erob�= 0 
not_a_real   �<�;�:
�< 
errt
�; 
doub�:  �T |jE�O s�[��l kh ��-E�O�� T��,E�O��,� �E�Y = .�%�%j E�O�j O���&E�O�%j O�%j W X  a j Y h[OY��O� � �9�8�7	�6
�9 .aevtoappnull  �   � **** k     �

      ��5�5  �8  �7   �4�4 0 obj  	 & �3�2 ��1�0�/�.�-�,�+�*�)�(�'�&�%�$�#�"�!� � ����������������3 0 total_object_tag  �2 0 	total_obj  
�1 
cwin
�0 .miscactvnull��� ��� null
�/ 
sele�. 0 selected_stuff  
�- 
leng�, 0 sum_numbers  �+ 	0 total  
�* 
OGGr
�) 
kocl
�( 
cobj
�' .corecnte****       ****
�& 
pALL�% 0 	obj_props  
�$ 
scpt
�# 
OGSh
�" 
insh
�! 
prdt
�  
ctxt
� 
font
� 
OTta
� OTtaOTa1
� 
TEXT� 
� 
Ogth
� 
Ogcr
� 
Ogds
� 
Ogor� d
� 
ptsz� (� � 
� .corecrel****      � null�6 ��E�OfE�O��k/ �*j O*�,E�O��,j )�k+ 	E�Y )*�-k+ 	E�O�f  9 3*�-[��l kh  ��,E` O_ a ,�  
�E�OY h[OY��Y hO�f  _*�a a *�-6a a a a a a a �a &a a la la fa a  a  lva !a "a #lva �a $a  %Y �a &�a -FU �  �� ��     ��� �
�	�  ��
� 
docu �  U n t i t l e d
�
 
OGWS�	 
� kfrmID  
� 
OGGr�
�
� kfrmID    ��� ���  �� 
�  
docu �  U n t i t l e d
� 
OGWS� 
� kfrmID  
� 
OGGr�
�
� kfrmID     ������  !������!  ���"
�� 
docu" �##  U n t i t l e d
�� 
OGWS�� 
�� kfrmID  
�� 
OGGr��
�
�� kfrmID   $$ %������% &������&  ���'
�� 
docu' �((  U n t i t l e d
�� 
OGWS�� 
�� kfrmID  
�� 
OGGr��
�
�� kfrmID   )) *������* +������+  ���,
�� 
docu, �--  U n t i t l e d
�� 
OGWS�� 
�� kfrmID  
�� 
OGGr��
�
�� kfrmID  
� 
cobj�   ��.��  .    @T�fffff�a  �`  ascr  ��ޭ