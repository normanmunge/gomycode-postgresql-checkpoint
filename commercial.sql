PGDMP      /    
            |         
   commercial    14.13 (Homebrew)    16.0 $    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            @           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            A           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            B           1262    49183 
   commercial    DATABASE     l   CREATE DATABASE commercial WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE commercial;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                macy    false            C           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   macy    false    4            �            1259    49185 
   categories    TABLE     �   CREATE TABLE public.categories (
    category_code integer NOT NULL,
    category_name character varying(25) NOT NULL,
    description character varying(100) NOT NULL
);
    DROP TABLE public.categories;
       public         heap    postgres    false    4            �            1259    49190 	   customers    TABLE     q  CREATE TABLE public.customers (
    customer_code character(5) NOT NULL,
    company character varying(40) NOT NULL,
    address character varying(60) NOT NULL,
    city character varying(30) NOT NULL,
    postal_code character varying(10) NOT NULL,
    country character varying(15) NOT NULL,
    phone character varying(24) NOT NULL,
    fax character varying(24)
);
    DROP TABLE public.customers;
       public         heap    postgres    false    4            �            1259    49210 	   employees    TABLE     �  CREATE TABLE public.employees (
    employee_number integer NOT NULL,
    reports_to integer,
    last_name character varying(40) NOT NULL,
    first_name character varying(30) NOT NULL,
    "position" character varying(30) NOT NULL,
    title character varying(5) NOT NULL,
    birth_date date NOT NULL,
    hire_date date DEFAULT now() NOT NULL,
    salary numeric(8,2) NOT NULL,
    commission numeric(8,2)
);
    DROP TABLE public.employees;
       public         heap    postgres    false    4            �            1259    49202    order_details    TABLE     �   CREATE TABLE public.order_details (
    order_number integer NOT NULL,
    product_ref integer NOT NULL,
    unit_price numeric(8,2) NOT NULL,
    quantity integer NOT NULL,
    discount real NOT NULL
);
 !   DROP TABLE public.order_details;
       public         heap    postgres    false    4            �            1259    49196    orders    TABLE     �   CREATE TABLE public.orders (
    order_number integer NOT NULL,
    customer_code character(5) NOT NULL,
    employee_number integer NOT NULL,
    order_date date NOT NULL,
    ship_date date,
    shipping_cost numeric(8,2)
);
    DROP TABLE public.orders;
       public         heap    postgres    false    4            �            1259    49221    products    TABLE     Y  CREATE TABLE public.products (
    product_ref integer NOT NULL,
    product_name character varying(40) NOT NULL,
    supplier_number integer NOT NULL,
    category_code integer NOT NULL,
    quantity character varying(30),
    unit_price numeric(8,2) NOT NULL,
    units_in_stock integer,
    units_on_order integer,
    unavailable integer
);
    DROP TABLE public.products;
       public         heap    postgres    false    4            �            1259    49484    products_product_ref_seq    SEQUENCE     �   ALTER TABLE public.products ALTER COLUMN product_ref ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.products_product_ref_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215    4            �            1259    49216 	   suppliers    TABLE     n  CREATE TABLE public.suppliers (
    supplier_number integer NOT NULL,
    company character varying(40) NOT NULL,
    address character varying(60) NOT NULL,
    city character varying(30) NOT NULL,
    postal_code character varying(10) NOT NULL,
    country character varying(15) NOT NULL,
    phone character varying(24) NOT NULL,
    fax character varying(24)
);
    DROP TABLE public.suppliers;
       public         heap    postgres    false    4            5          0    49185 
   categories 
   TABLE DATA           O   COPY public.categories (category_code, category_name, description) FROM stdin;
    public          postgres    false    209   /       6          0    49190 	   customers 
   TABLE DATA           l   COPY public.customers (customer_code, company, address, city, postal_code, country, phone, fax) FROM stdin;
    public          postgres    false    210   0       9          0    49210 	   employees 
   TABLE DATA           �   COPY public.employees (employee_number, reports_to, last_name, first_name, "position", title, birth_date, hire_date, salary, commission) FROM stdin;
    public          postgres    false    213   �B       8          0    49202    order_details 
   TABLE DATA           b   COPY public.order_details (order_number, product_ref, unit_price, quantity, discount) FROM stdin;
    public          postgres    false    212   %D       7          0    49196    orders 
   TABLE DATA           t   COPY public.orders (order_number, customer_code, employee_number, order_date, ship_date, shipping_cost) FROM stdin;
    public          postgres    false    211   �m       ;          0    49221    products 
   TABLE DATA           �   COPY public.products (product_ref, product_name, supplier_number, category_code, quantity, unit_price, units_in_stock, units_on_order, unavailable) FROM stdin;
    public          postgres    false    215   �       :          0    49216 	   suppliers 
   TABLE DATA           n   COPY public.suppliers (supplier_number, company, address, city, postal_code, country, phone, fax) FROM stdin;
    public          postgres    false    214   `�       D           0    0    products_product_ref_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.products_product_ref_seq', 1, false);
          public          postgres    false    216            �           2606    49189    categories pk_categories 
   CONSTRAINT     a   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT pk_categories PRIMARY KEY (category_code);
 B   ALTER TABLE ONLY public.categories DROP CONSTRAINT pk_categories;
       public            postgres    false    209            �           2606    49194    customers pk_customers 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT pk_customers PRIMARY KEY (customer_code);
 @   ALTER TABLE ONLY public.customers DROP CONSTRAINT pk_customers;
       public            postgres    false    210            �           2606    49206    order_details pk_details_orders 
   CONSTRAINT     t   ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT pk_details_orders PRIMARY KEY (order_number, product_ref);
 I   ALTER TABLE ONLY public.order_details DROP CONSTRAINT pk_details_orders;
       public            postgres    false    212    212            �           2606    49215    employees pk_employees 
   CONSTRAINT     a   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT pk_employees PRIMARY KEY (employee_number);
 @   ALTER TABLE ONLY public.employees DROP CONSTRAINT pk_employees;
       public            postgres    false    213            �           2606    49200    orders pk_orders 
   CONSTRAINT     X   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT pk_orders PRIMARY KEY (order_number);
 :   ALTER TABLE ONLY public.orders DROP CONSTRAINT pk_orders;
       public            postgres    false    211            �           2606    49225    products pk_products 
   CONSTRAINT     [   ALTER TABLE ONLY public.products
    ADD CONSTRAINT pk_products PRIMARY KEY (product_ref);
 >   ALTER TABLE ONLY public.products DROP CONSTRAINT pk_products;
       public            postgres    false    215            �           2606    49220    suppliers pk_suppliers 
   CONSTRAINT     a   ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT pk_suppliers PRIMARY KEY (supplier_number);
 @   ALTER TABLE ONLY public.suppliers DROP CONSTRAINT pk_suppliers;
       public            postgres    false    214            �           2606    49294     employees fk_employees_employees    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_employees_employees FOREIGN KEY (reports_to) REFERENCES public.employees(employee_number);
 J   ALTER TABLE ONLY public.employees DROP CONSTRAINT fk_employees_employees;
       public          postgres    false    213    213    3486            �           2606    49289 %   order_details fk_order_details_orders    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT fk_order_details_orders FOREIGN KEY (order_number) REFERENCES public.orders(order_number);
 O   ALTER TABLE ONLY public.order_details DROP CONSTRAINT fk_order_details_orders;
       public          postgres    false    3482    212    211            �           2606    49506 '   order_details fk_order_details_products    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT fk_order_details_products FOREIGN KEY (product_ref) REFERENCES public.products(product_ref);
 Q   ALTER TABLE ONLY public.order_details DROP CONSTRAINT fk_order_details_products;
       public          postgres    false    215    3490    212            �           2606    49279    orders fk_orders_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_customers FOREIGN KEY (customer_code) REFERENCES public.customers(customer_code);
 D   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_orders_customers;
       public          postgres    false    3480    210    211            �           2606    49284    orders fk_orders_employees    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_employees FOREIGN KEY (employee_number) REFERENCES public.employees(employee_number);
 D   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_orders_employees;
       public          postgres    false    211    3486    213            �           2606    49299    products fk_products_categorie    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_products_categorie FOREIGN KEY (category_code) REFERENCES public.categories(category_code);
 H   ALTER TABLE ONLY public.products DROP CONSTRAINT fk_products_categorie;
       public          postgres    false    3478    215    209            �           2606    49304    products fk_products_suppliers    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_products_suppliers FOREIGN KEY (supplier_number) REFERENCES public.suppliers(supplier_number);
 H   ALTER TABLE ONLY public.products DROP CONSTRAINT fk_products_suppliers;
       public          postgres    false    215    3488    214            5   �   x�MP�N�0<�_�@H��Ҳ'�*핋7q�4	vڿ�i����g2c��=�	�H��E��4Q�P���)^(u��1jL�O�1�N3[n�@�$���MTvn@�s7J
՛��-��ݺ���I?l {��Y}�b(7͖�7ܹWB3�2
�ni%ܻ�� l�$�� +G��$
n�:���)��6�%[e "[أ]bɵ�tϟ�s;�{�\R6�w:Jy�c��% � q�x�      6      x��ZɎ�Hz>�"�9TP���~���TiQ����%$EJlQ��KVe����6��t5�������z1?�5�kƍj��RG���-?;��{,��2���MY*�Dy��x�2��"kr�e-��Q�!t?��V��tSo�k��8^;�ek�h6� )�$J�0�T����T��Ɇ��K��9��4�?�)�4o�L�ua��������ܶ�雂i�t|?cA��ɒk��Ҍ�J�w2I�U���l�&�4a�����æ�,��q�D�ר�s]�;��ֵVwzғ�bl��<���f��]�]��?�\��s��X�������,,�?-_Cp��}�r�� ���DB�:*�6�Py�v�f9���=�I�Vі9��;��v���Y�~�􅅝ǣ	v�S����?!o��OQ�3a��X.����H)CFe>O�l�W�uv��dA�lz^�ћ��4���Z�A��Z�_�h��v���2�L�d&q�� �Q����_fђ	���wս�ױF��'�K�ྏ�G�!M����!��yV*�T9o��b��`�,W��S׽Ӎ[M�h
�i�MK�^�x6b�H��N�2��h�
��\~��ފ��MvZ������bm���7�nյb�¿X�.�����w�P�r�rv#ˤ�Q�/�e�2?�e�-�^��@?h��=��ы����F�9�Yf���,*Rn�&k�讜Q�S�Б�iQԱ�a�lm��FkwG�6�I�,�t��E$c��P��V�0�8v��mV���/�U|٬�/N����w�I���t��K���qw�bw��U�#�h����A�!	ȥ-5� &�����g�*P;DYʂ�&_��elA��TX����Od��G�SC��l�9�b����Σ�;'y��FS.�+�2JV9��FŸ�[�-U���y+SU��O@��� !�ڏ+�@�w�A��:�D]'�,�<�8W�G��@ՠ����\!�����o�Q�k۷��u� �Nɷ��� =��vjG��L
��EU�#Z�̲.�@����K �</}�ѺA���J¬�$jQD�i�>��oU�
<������o�G�{^��kj�)���%yA�Pc}4�zE���j|e^U�e�E�s������n�a/@n�8�<� Os/S6-%g�_Q((��B�P(��e��pY��!��O~#�8[����e�X�^�0a3h2p��_e�*���s����%&����1�`�-�!���{K�@�{ u�T���3%��𗉌ؠBGۿ�uw�}^/]:�?�#6<]����G~�b�?m@x���b��b�@v�ELv";ǧH��S�f��թ� s��A6��'�,^�E��?IUў���eE{>��uM��xm�F����4W�2�U��V]�TWx�ױ)��`\/�j���:B�v���0��hE�@��fi%i��:�a�a4,������{?���M�a��\����de�y�}��I���PA�L��f��%3P�l�fE��q�ڦm5��;�X��m0�v�-�T'�G�(�$ݢ��v�׼�\����d�-�-ԂD�	���h���䖍g�\���3�mJ@�NQ"�l����w��AE,TϨ@�,��طf�>1?����
2e@�OE�#(o�sHG�A����A��4\�ї�iU{N��̔�7h��4]��	�H��@�����Z����T�"'X�AZ�y�bL�;��>��AИ�������Ϫ���D��$��m�����3�Nz-��@D=�!|�8-���v��)�0�Y�le��
��M�?����������=�
q9�DAU���
?���� }N{�5�9*%�n5�`!U������ӄi9����0m����W )�����to�a����ݏn��LV��v��b��v�����5`���_(R�WiR%�{�*^�y��'ܯ���\�b)Lש�9��1�V�YJ�'=�!]�dҏ	0D.� �6$w/�)�L�@7�X]@l�Z/3���|��c�8�j(s��ҏ�&�/��#R9�w'�)��C����������$�*��n�������H>�W2'�nX�{�	���T� h��l �T_��s�q��$�J*=��w�2Kw
�d���.!�h�z��[M����n�=:g+���|� G�� ��<�:��(h*�1`��v�1��K�t����m�r�&eD]����J��<����rS���v	b�}�K_��Ӳ���?�q����>�e�����o���G��H�!Ҁ��'�*v��������t��3u�!�5=�+��&�ʕ|��~nͥO%�D6�M��ޕK
��=�t�N�����/`G�;>�!�7�\>!�G���фuKWi��E�|�����C'۾� ?�5>a�S�	IuD�EZi��^���!������R� ȱ<�P�0s@�P��р��NW�N�;�>$�$�+��i6�P� 0S4�$�k��A��+��|O�<�gZہ�:.|�A�0u'�^Un���3�3�'�"A����O��	 S��S�횗K�r�apX�Ҏ�Gh�$)��Q�DET	�A�L��tE��p(���4��J`��[?_8�{2�[���v���ڭ-�nC~�����0������Ӊ�tz���j�i���V��	a�!��
PmHz���*p�������y�M�84#D�u����xz�'EҮ=ǭ��d�I�ݩ��!�h�� �zLE�� h��������?��5�>k�6�$(΁�_�=L��rc���fI�>g�g��6nw�/�(�����+���l�^�j��%�L�dA�ڳ={�!���������->$�x�y�q��h�%?�	Q�p��)Ae@ʋ�@0�����u�(�<�b)<�7���l\QeN��s�Ԓ�J�3�]�b�@i1Ժ�W94�r,xs���NA�hH��M�9�w��4��
H&�=��Eh�D�	a>��2צ����,�4��M8�˥�j���f�b��e�4�)�6�]����$Q��4�|;�0ߎ*E5��a<4��c6��4N9�.��UQ��8~�X����:�# q�2�ɴ7�	ҸP9h.!�C�����R(&��������w�����0�B��}��e�~���/{�A%�:��"B�A~+E�	���R�\\�h8�s�#Vu"�[Kԅ�*�m�2��k���t�A��� ���z�>�>D}l&��!�����E�2QeL�0u�
%\r��Ajְ}E-�W��'M� ����h@���S�y1����8�(P�	�	=�𹖧/Lx�ˇQ\fg��x^� �J�s���̙���%���M����S�Z�Ӓ��%4�������P�!F���/Sޭf'��c�'p\�ӧk���`a����%X�$R�Ԧ���`�� {8�߰2U�x��e���C�yxO���#�҃T9��Fd���t�T���gRm�v�9��l@h4m:v�xp������Eލ?�G��/�5W>��v戨~�2t-F�[�S�)~���K�@�Fnȑ�����s��,�\2����'@��H��|m����`�gՐ�8-N�kz.,��H��&k��C���}��L�ݐ�:�/T@�ڋ��סg���R�����5ln�Z_�W�����&M����m
]1�_D��N���?�����\�� ���ƀ�/L�Rtm"�F&�v���d���!'[="���p�g>p.��m�v�JC�Z�?�ɠ7��ؚO�`���3�1pKsLZ�=�̘P{d�ȏ��t^:����~2�헻l�����-��:q�}P�9p��7� �2J2�-�j�&�����fw�V���4�Z�"��!Y?��' !������J���[��� �mO�}�0@�(%��lx���/|����nZ�������ҝC�x4�:-=�3��xN`�0-;�Z����b�&&�2��j�H"�}�|�F↰������{����	N�-ƃ�B-$��'w�_j �  �iйc�������.:���z����Q����%��t{�,��+��UF1\ݝ��#��؝Gp+��@bޑ��QW?�6u����d8f@���R����Mve����t���±�8�?e����詅=U�D�^�F;���v���E������n]l��e_IB���&d�պx��z4�����\/]�>��e�qs(�gb�exx���w�|._�-���6��)�C�`�:\.�1u��)��?�Y�k@���\Ҋ��a�ڇ�,�K���N06)4��ڴ��c0�ݱG�'`f$6�l�j޼�E���e\��+n��K��рpv �K��;��#X�TC�j;N�u��"�@���L]~�~�h�(O����&�h��k�#	���Я�O���*mCw(���(P\/������x���%�z_�2����Sq%��	(�ˠ�?��F]^k���w{L�|q���^�.Y7��U�~������U~� ���	�z�����=�zu�+��ф3|��ȿE�[��7Y��ݺ1�!�cˍ�6���y�$?q0��'�E��|>���Y�(�Ma�$�e��$X �v2�f&�����*�!L�r��f./��\D�_t�����������G�H���������j      9   d  x�}�Mn�0���\��bH�����T������Ne' n߱�
6�ri>�7� 	+<u���]s�Zf[��M0�Ǿ=��@T�	�xI���qJ(�sBsNg&I|�5�n��>���6ĵ{a�s��4/��&���ɀ)���d�m�^љ�q8�'�H��PI�fA��`�5�P�?�����b��WSL�S�R�#*u25�OCsD�v=%vYӯ���a�5R�3����4�� U"��{���vx�I����Ƕ���ݗ�w�&��r2�����Tc�r�J����"5�5'pBz���n".��,��mӊ���}8w�?�3q���Vת�	�Dy�>�,�� y�R      8      x�u�Y����E�O4�SC_���H�%�%��_ļl���'�������y�R�{�K忺z��4���~ؾ?�������������_�������oˏ���m?~��v�������c|��o�y�1��L�S��E�1��l�ӑ�G�1��|��Q~�G�1��|��Q~�G�1��|��Q�G�1����1��|��Q�G�1��|���~�G�1��|���~�G�1��|���~�G�1��|����G�1����1��|������1��|��1~���1��|��1~��z��]�q^�'W�m��)���-|{͔����?�p���_j������D8��{q��1��iLo�؟��}Y���j��Y�M:ߕ�-j���EtX{�s����fg{�~[E�yW�e��k��',3�>���w���&P_2��9%�탔�Ŕ�y^�wY٩$��--�4�!�[AM^������f�;�dг�==����� O��.��w \t�����2��"v~����Ǜn����{Uvs�	=�q�l���β����wO�q�!��[���C,��&�?xw���ך��m�"Sh�O�I�F>V��E]�~u�1(��1� $�f�>��>N�|�I�x�qTQ��C?�D]�绿j�U�-,ێ��5������O�LvhU:6[C�����U�-�����cy��j�zD��T�`���q�o�m��p��q��d=!�{6�5RH�����v�	�a�,P$�'kk�,�nXҒS��54l�*���5�u�3����O��EL{>�K�A�>��׿�Єd&1��6�\�l��\����ԙk#�G���0Z�����#[�bZ��Jʚ�b�mG����u�u�7��!|�ѵ��.��!����2�Ô��N�aKi��
���vZ��!�r�7�ylԼ���������8܃m����2L�M�����woD�9�ݟ�F�q�����M1O�(�����It�^�R[��$4Ĳj�|	�Ю��n�((,4�P�I��K퉺�V^�����y���]��<y����@(�7��U��eD�G{��Ek��K�to���6��Y��u��Ȑ0�in* )��&,+,�zNJݠ.�N��^Z!��E��: 6*E�d7㑍�Y�>�ԫN���l]��"���Q=��4�,s�|z�q��s��Y�z��,qZ���	���iG҃a�Ml�jO$f���CJuF]ĀZ�6��)XL&d�i��)�X<��sS|&�o�:Eƪ������G�����$C̭.H�;�3��o�Ŧ���ŜK�O*���A�2�Qn:,�<TER�S����`�a����khK����a��c�A���C`=�Xk��ݙ�h��x�f����]W��.�G�})��9�ԻNV��7o n���g�o�&��G��/�!�ݣ�ΚΓ�m�G6�D�ʚ�a��n�	vU���s�-�o��͂���w	
�:��`�BW�F��,�5�f]�'
!��Z�1DNL#�Ґ@|�mҹ!5h�Іm�e\sr�$��?���YKlB>���esҵ����ƕC.9`�.*5'�ڞ���PY���˱�XWr�[gM5���-d��үd�T�����aՇ� I�����E�̗�����=�M�6�Zz{9��O`��iUW��To�F�5�0�Si�?	��B0�~UIo��R��|���?T��%\���i���M,�'䏷#��Ȉ�N�+*�Eߠ��B�c���mj�@�/	���o�C�mc���ɮ��=��6("�=����MoC�a��ڌ�d�7ɲ��Օ�S�u��i#�������%��޵��ij���@K̸j	���0�Z(z�\p�*�f�B��p�	�k�s�`g�~��VS�or�����۱$�#>�@J�ΰ�Og!���nC�ز1|�M�B���$�\���~��C�h�k���R]����I�U
�[�	�&_є�"L � a���J*0�/�A�����Ga�l����B@�0R@[�'�kD�㉾�,��C��3�l�K�æ�$�N��N��΄�7�l"uS�#=�E��ې�P��0�!A]��)����V/A]��C|���Q���f�;�k،�f��JeaK8l�hǂӝQ�';t���J��@nV�^P����Ew���9#3���z�>��z(��Խ����1#�M)�k�ve��&4��iSꫛ�"��� ��E��	��u�|��oDl5|k���8�?��2���u�6�!��@����ck~5��'��'v����.,���hr���_�P�`���!������I�T�0��wv�f�0��:1(�n�)��C�O���ŕD��Q'���1���Y�f}��ҁ|�=Fx(��o荠�BhI����+�W}&�#<}�펰�|橆F��0���`����V}KJWv?5�]b��iF�|mԭ<>���'u'�5�1��S.q`�&���U�ٝ��s���>Q���46n�N)��)J���wƾ�m.rI���Dث���8R�a�&�%֐�%d����,�X�ox'.?dy��n2,��RJ)��~Ӹ�ƒ"4�OÙ�b����� �6���.�B�,_�1�h�h�Q��p&�Q����_e��D#O�-���A���H���.9^���P7�X���>�c>�P���&ͅ0ϣ��BN�}]	ƭni۲t��A��N^)��oi�4UY8=�;&�9����{���؝w7��V��"�ZfL��X�X��4�0�tq��=�B-�6
*��L?�>Hsc]V��Ř̖��ka��5'&�{�l��db�yܴf-A$�1ِ�	:�5�"<I�C�ӑo���v�5
�s����\�V�@+���_�ҺWt���b0�N�s�U��ߏ��`��゗T��Ea_s�]���V�b�v�_F�����v'QĮЖ��6%�������j�H��v* SʉQ|]���S��#Q%� ��rsx;��ɋL�`7��Fo�nkh���c�n�s��;H!��0D�[}蘁7?�O�v.~�*\��}+h���1<�<��@vj����^��d~[��<b��� t$�<�y��k�q���1Xs�7�p�Q�dz�.za�7nk��?���g���)�cy焔j�����S)V%�ˉ�W�����(�s:8Qi��Ϥ�+��S[�]t��?
���2�c��@���Ȯ��u7#7bn����JnӸm�Z`7�*�'��2>�Cqz_G��+B�<��'��x�ۊ�,�5��,O@.��'�_��+V�'JYg"[�}�ԙ?�yuJ�x��`���P���o��?�Z�،�x0�]�� }FS��J�@�t#J~�q��f��}��9b�L�aޕ�
�sz���|�'��������*C�~��c�Rȅ��!��
cH�W�O<���U0�"&|�$6�|`wE��+=XW��K��`;@�t��N9О�줛s>CX�m_���0�3r��r�O�:'��^��1�yr��^=��P��j*cK�=�IY�%.�&
���*� ��̧��P�Oo�c9�O��^��[�k��X�B�=�g�e���#�B%�Y,�C6�\�a3.�/�IN��96]�Яs�vE�3��Jǽ�{]���q,��P��$l������t6���	�+1�R&�x[5=:t�;S��8�h�`�<�*T��:�g��~K'�W�7��t8*�[s(�oqe�@���G�Yí��\67L���y� 5������*�LF�������Е�b�Sz
r�1��|�ڪ����O�.��͠ja.�֌TMs$�DI�n�����н�q�8��"-��xc�ה-?�����R�׿���ő���fR!��ٷ���o]r'�0��W�����ڰo
v��Y�vn���CBc�{�K�l�_�YLfUUn�����V�C���M]>zB��g�U���c��o��E٥���������މ��Y�;�p��5�V��'Ymtu�oK#����1��e�O�,��;Zn�~q,��D�M���    D�l�ś�Eos�wm�BNm�1B�Q���Ri�]��h���ܕv=�h���@��{va��M��8[�l�4G����۾���*�����٨�Ba�h#�bV&4� ��/��t��Ԫ2l`�ʹ�U�Cȭ�u�M��\b�Ú���*���&hY$�����0퓝�9���Lb���`��1�pF��8�����׆ys�	��!�]�m���C��A�A�	���*�9�
��^�|�?��Io]��qc��߀�s�s�Jn��|;*�C���4o&]ސ�+_��Un� �$��,���Zˬl�Cثְ\Rc��o��l�OP���q��^�2zC���@좖�D.��]�7r`<$y�́zio���Փ(f7�#�������\Y��{���^�0�mok�z�A3%1�VӡkKݽ�"��K��^��?����@�E'q3��>�6➡d=�#�\��mX6�0סWZpd��
I��RZ'1�͸)���^6��������p7J|�h��̿P[��.��$c�ƇtD�/���F�̿���#��d{�5�<S#.�X����,
���L2�MTi&�+�M{��Q��M�I=�/��Qi����B8��h�%A��FUv(�$����3оB1`���b���3�I_���m� �i#8�6���H��Ea��^�]��
dk>�A�)�4�8�qf�������eV�"��B��^?1n�a��1N�L�-���폳C1уY�:�r��=֓���$]�U?)���#/^x��\~u�����km��6���J_mQ�і��	Ҧ+Ӈf�ͧ(��c�]�ZV������%A9�&u�Z�ͫ���б�-��]��m��s%�)��2��� ��Z
~���I�,�M���Ws����UG��Y�������_�O��8����:�i��ۯt)��p�Y��>T�~��ɥK|��Jԓ��%O(	�/C��k�� ި���	�H�^;O�kp�$f�勼� ��8dWCPzȼ��f� ��B<��8���~������8��44�T��Cl���.�X	��+%�`���+[8ա�t�������w�UE(����pz"��)�!"׻�s�l�C� �>!4�&Y°L���m�\�Jp���]3�8������}`v��v���|��9�6Ɓ�P�}(4���N]�����6䐆P%S�;�=������w��(����e�d��%���3�P��t	�Y`-}�?s����/�<�-��9�j�D!���i���2/�[�8ģ<Us��c�������2�.>��m�t%�KwZ���Z��U԰�`�������V�^��fԜ�m��W�7�&P>/�5�R�Ow��I�a{��or�������0���ǈkʣ&T�]�ƹ&��&�E�ϊ�A�mC�_q��K�*���m���"`qW�����Uz@�3�֔�<&B��=�l��{2��/O�f�z̠`�u�\D��$A��q�VR�Q� �l}@�𑽾=�O����@�����r/е�#��� �;�9�	��ʥkWZҙhG��nԶ��*K��
m�^�dR��]�|�BjU3	5�T����-�5ѐ�;�r�%	��l�6���1w���+:����]��X^���a�0_��@��X��M�l�����Ю�V�bt��ȱ�;�A�\����b�;2m�(gw|���-Z��e�&k9H��Q�d�U�s��'Y�(�T}C����o�k�#��\�;�y����A.nC;��֎+��#�p�G�|���)H�i��1kG.C��(-b��s
?�V^ё>x��`�r��;��Ǵ�U#�(��`6?x�O*Y%( ?[��Ȇ�k�O���`>�Nq��^	��g�s9S�hs
16o|��wM�)���[���Pk{rh�3�]��zz6�a@�
t3�����%w*��{ہz,��
D�M�m�$�06�C	]�
��Z��'��`"�����F��
����JuF�k���9ph�.���Y����]��^���Y��ʑ���wSӖ��:DeX��2g֎%���n�������ӠȀ���7�}`H�?֖�53������h)�zi<��*���pꖇ���b#����a��+:@�t��,�_Υ4e���O\X`�7F�sw�������|��>y��<h�:4���쭡!:=��&@O1=�՚�	��^3)�ha%��|$O����H�w�f�r��A݃q������~������r�k��*P�ҙDНf�TcX(7��Ds|}hN����\ɑ��S���d�a 4G���,V�8(~�1��S
*�(m�3xK}"ɫ`�r�@��,��#����%2u�2�+�L{#���¿E�nU�؜!دb���6�\WO��4Y��c�qFאk{�7f'��5��kG�a`�;E+���֭
D��Q�*��mF��䣾b�M�M�
Y��fF
��fO���T	C�v(����R��*�H� �]��d���%�h�}u�C�I12����1��q
�5�]}D��ۡe[�����'��0���S��0L�se�S�O��a_X9�� �LF=Di���ƚ!}S����I�=Yӝ������+U�wG��I��Cžq�H�"�Z��A~������Z�!��v���|Ĥ��ݝݱ�Ѹ�6e���qt;�'VܾTZ��"��P�������<ed�TGr%���$�~HN3,�:��fP�����#GV%#	��(���Ԍ6�x���>3��)<4���פٳ��e�,�k[W5����i?�&�����0�i��B{�QR�b!�^5ם��U�5�{��k^��yڢ�]n�U>��zp��dwW����It�ޣ�y� ����C���L��>�A�ѩ�v�ΛTc�9�s����z�w�G(=б��������>~�T�2R	!�Y�I-&hC8���p:W����Y0�s����)�M��1a�1?���X_d��Ƥ��Iߤ�M��BK�x�����g����Ȥy�~��{�m�$�$�oW�^���y��]����X@����t<�#�X�ԅ�+M�>8TLf�Ї��K}�(�0���p�k�opV9�\�����<��|צ	b9RtG�U>'�����׻�9+��R�b��4�PK�c���W��	�s$�������[�+D�Q���a9���*��Ɯ��묢`R9�@��:���Kĕ��c~������0�c��h��T�뤥rFhG ���!�#=Q<�������*��3�����i�/��Ԥ-�C�Ռ�m�~�R8���|�#�"ql���YH����2)�����_u�3�p��Ye����zT��2ʆtx�'SX;�Z_W���*g���:+7ӸN���Ǐ��BC-����#����c@�pvG@f~��癯ӎ��S�3�:.ή�f.��|�@�iuo�y���5v���	���/E��|R��}c����}{9��o�M��i�H�;��_�z��aTQ�/���ں#�o�ٝ�>�oPUYH3dG.$�I�))�a6�@���h*9��ZZ` A�
٦� f��=6C���稿��|{�ɻk6~t�;�Q��S������`fw��06B��)F�5����jq��=z]��4�3���N��]�x�Ni��~Z�4n����9ɯv_�1+�>�3���0�r��%�TMm���Pƍ(*k2Q1� -Z 1+�S����7VcPyJ�+���W%�R��ҹ��˥��)�0B�r��ۉ
Ur݀���#�`4�=2"���2���'�UU�t�6��["�E�s�G����Ⱥցi�S�C���J`}���O�`�Ugd��������S���Sb�1S6۸"����5Q�'����>,CUD�)�F[���Գ��|��s]��,��OT�㚳���Y������O���s��И�W\��<�frۃ?�����$$؜zǬt�دi���������/HF��+ܾ��Z��S#QX
��BgQD\Y�y�X� {	  5�9�7���9韑{6#����<�q>$fX>7��ՐB�DĄsP:�ρ�c�ִ�##�(�b��1�WX�@6�y`�t�6����bo�wzoN.��r>��j8�*�̜=��d40�Z���Z��9Q]0�����뜵���������>��d۾��������M:�c�u�OhDJb���O�uN^����R*w`	6��@�z>�ҹ��~Gq��YV^b�[Y����|�!%�`�Fd���z���nZt��2!��Z���v�ڜ�"[���ٯ)�c����P��C kI���T�f��V�i�����S�)�[!b
�r��i���Q������p�^sFv����}w��'=�.BQ�]ϼ�r�=e���XϢ1�>a��'e>�����~���wiڢ���,���mͬ�/E�Ӟ8�ى�U�%`��)U�?6�9���9*!,\~x��vG6�ݷi��+&9�Tخ�`��MX�3�*Kr��=4�����U�h;�jZ���r�;����Z�]N�r�;bt7>w#3���4�V3�}��//�����]�����
�*�?�6=,�Q��c-q�� ���JA����k�!ǡ�/�x�!����`�*UWv0w�2^w�e��ġtN��a��˶LJ���������צ��-mY.��@���q/��P8��.�B�	گ�l�Q��ten�����ԇ�� 8E�s�<�3J����,,=ddV���v�>�{�%�]���~��v��m��`�[�څ��c'�8�ck,����=�q,�?������X� �-�J.9���^�{5����)������][�t۪+��cKB�1[��iL˜�`�+J��Z5YZ�WX;�ת)���Θ��:�ŋQ�~\����O��ʨ�X�d>���ӫq}��vW��6�|����EP*c-�`�є�!���5��^S�n}z>�?ם���}��qv�f^Ǿӹ/�-R�uU�S�kg�T�@�Q�{ڬ;�>|_�����"K��j����V$a5��Og����-���Z�R�Ț� ���	F�e+��A��Y���5�"��!ua��u�F�7�)cE��.M[R�X���|
�;���O[,�����յ�bq���Q�5f�>��y��ҍٖ�u�{�R4M�w�"�ظj�B�UgT4��3�����Lw$��}Vew"{M�$
s~K�$�������5��&_�g�5���@N��=�k��t���v����Ł3oG�����ϥ
�.m���Ǐ�z΋?֤��d}��S�k������n(�L�j�9�I^�b�W��u)���e�_�a�!�������p��J�����e6>=^�pظ��B�ө_#����`�0��pv'��.mXk��J/G�آ�{�y���كö�/8,�R{���!��:ո�,Ty;�ʘ�a�S�%��>1c��I�07�ȉt�Q���C(��w����j�r�o�,����}���)v�����p��D_��j�M�s��]!���2$t)��	��L5[��u���r�y�=P���0D�q��9���)���7�S̇Y�+!�o�'\ݙ�KƝ"�l~�^�K�#� �MY~���z�t03���6�b����V~�}fsCb����6�:�����Z���aw��@*Ա�-�_����?�G�F�m�n8~��p=g��瀁���z�����@��uP$��&tAb�曎M�i��-�L��"������q�19�s��g�6��mLJ�f+��Ks���),����Za#����+�f[Wە�9Փ`�߂<�Jul֯���~|��6��R�ay�;����Z�Q�W���CBCd^tq�箰�
�³ާ�6����ïݩ�SѲa�\���ǝ#[��/��U唓[t/w�h�pǮ.�-ra�aJ�W��/�
��K/m�} ��tG�͟����9�b��+��]� �o�忸aM�������BF�ہxa��mFg^+�W�6�c�����-?�"@w��oAmToB��'�{`�sj�s�G��?|t��R��u#�;/�*	VZ��ᇅ�^���:��R��g��y�î�`�����C}�4�06�`����a�"��uJ%ڲ�X���h�?ZrЌI%5�:'�������Q�u�ƻ��� ��r<�<��+�g��7k3�k�^#��a��>�?����R��U��_zz|��oF�(/����ɳCa��.S���_�4�cR�e����?�,�����ss��ͮ�<]��^gr�$������Q#�5�Jᄐ?��<�}���E8+-�aO�0%�Bp5���K�+���>A�`��-ܦ�W�a<C��醱����}t�S�(#���t�F���l������������r�T2      7      x�u}ߒ^)���z�e��z�Iz2]���u'��޵��:>Pt=S5N�_�c�����o�.�b��G�?B�͘��T�b�P����~\�W�)��P�鏐��Kק�_��_�M���i6+�� ���?�~��:��0DB�������*�k�#�f,Wy*��������ϫ���l�OW,ׯ��׿f�����L�}jm ������?���$�S���o/}��t�����tlOȓ� ��/���M����ԑ���_�|~��F��c��`a`�_�?�߯(��0�Ú���K�4��o�߿9`�y5i��r�H������O[B&��4�$B�����7$�B�����Tx��:_�^�W�65i��)d6�WY�_�Bh��f�y�;��������6�f��������y�������<0>e�L�v������e��,�u�5�{�������4�f�i/�@�}~��Kr�*{A���tf�����3~M�s�ha���������4����Sb��ү_o�?~
�`0b�M�zmOa {����//���wQ�wK�%���~��@�6*S5N,��m};]9��8>^�����_/&Nh�R�'����?߿�^���+Ux��:��g<��0=<5@U��~�n Xhq
�_�}{��:���:���o��n�q�ѱ��T�1��4��گ�/?~}��.Z�]|��׿=r͏�m�*�2���C(��j�fi�Û�xa��	j��M�,j�{���>�����4��4�����|��'����|(驏`�n��f��%e+����o�����&2]�Ͽ���{r(�U�֘�������jk����ʯD���/�|��IlCT�����������W�h��Ҫ�P|���?עzt@�TKwd�H��)��6b�7�~QK*:�V�t���"钉�M�_�RkR)�&M�%jk���ׯ����LP�+��*�2r\��i6i�Ĭ[�'=����uJ���$P����>�|څ��׋2J�|4�$��AwJ%*���^��`ZқVlE5��;�4'~��>N�҄�9�2�OA�ҝ�(l�iT�d�s�f�jV���P�)՗H�,�2m�.PP�s�5�4�TG�H�|��։��g�-�rd���JY��L���;���i�sLR��і�A�?3)m�׏oϿM��DK��Os����va�~��F*��O��y�-̡v%��)-$�/$ф ��e�ُ�A#���~{�1�	F���:����Y���^���'��z�2�Pz���\�ԛl�L$�D��7 ǩm]�J�����}6�*�ڴ�
�{��ҫ�T����?��e�o��Rѩ%Zs�$7(��t}y���D����)�I�l�~_�JDO��K�p�|����DsDCG��4���$T���]o߾���C���u����wi-��T������>���\�m�sDށt�ꪖ�?�
W�Q�.���_�KT��q )U���mּ������
������<��*ف���������I�8�o��[?X�Ξ��o�ߟ_��E��l��LM��}oʧ�K�EU~3i߲���M�s��_gD����ϟ��@���Z�C�j����~"=Y6+߃P�?:������H����f�h�he�,��]5�@�_�5e��P���T���<�m�v��d[�R�����? X�ҿVU?3)�/�밸As�6 TS�W��P�J����~N�C�bM"�͉�d��H�Ot�L�����u6�� �N�I���۷�}�}.�8	t����gؐav
*S�ޓ~�:Q���x����ߡ�d)Ի�O�����j�Se�ɚd%�Ꞥ�^�^޿n��Y���M-|Bj�l�5Ը�n,�kQ���
7���Ĉ0�J�������h�SY�޼���O��P?sJ ��gM��2�P�Q�??���N��gҾE��~&Q��ĉ�բȤ}��4����U�t��s�N��0 )�r��^qAiV��B	�oT�}5���A��+�7(iuj���=[ͩX�4uP���r�!�5��?q�ҿ�����rSYM��ZTR��������	�a5 J��,�Oe��E@hV�������R��EW�~��6�Q��B\,��A״�XP�G+὇��*)�lY�ߝ�gNŚx%l%e�����_��M'�Y�ޡz��,<X����ns�nY6�".����募N$�zWk��?�q� �e��A��FO��i!�ʐ�&Ⱦ�D��*@����9,(YKdy��(9z!t��
4�6��\#�q��(9����W'��`|�ͭ� :��� %��Cօ���I�Gm����Tpف�+����D��$�J!\�e�?O�#���p
i���;t\�d�*,��l��d6�z^���l�{Z����w��*|�Gۨ3���s��dGf�YJ}ҿI���CM��2YI���q�?����xȟ��ƭC/�UH]8n�&� @�R�n���ƒ��6u�����i$XP�:����c��l��^=�^�Un�
��k��W!�*\p}~��}�*/���2�M�ٯ�����լ[�?���E*h֪�J�4�fA���K��5i-�����UY��{�fB�$*voV��E�Ns-E����l(�i��YEJ�������H'���'��d����Bߏ!�Y �,�T͏�|-Vi
�"iZ���%�?)�������4�G��TP9���ۂv�ʨ|::E�щd�\0��㚺,�oY,�m>��]�Q�j�TН�7$+k����L�����~��Oz�W���g��$��հ(�[��6�w����EUR�j" k��Q�XXl���	?Ѵ>��Jj]�YՐ�_�&�M�Z��憤�Wa�J�����w�Լ�	*S��U�X4��5����ju���J���m&�+ɌT�Ӯ�*���S��;�VA�t�S����5�j��H۱|��V�b-��f�ZHE��I�ԤZ}%b��q��K�������ׇ�O�����Գ�	��X�}ҫ{��$�a�E��������������*M�9r*�u\��j�/��=Y��*7[�d�R|�ݚH���}��I�I�z��d7�e���A�풬STuAY��u��ڮ��/�˲�봮c��Ti�"���y- k��A%Ig�-�!�_E�Jz��ָ}t��1)�E*-�5��:����eY��S\�X֮G[ͨ�b�C�H��ud���n�݆ ����nQ!*��b���6RV�B�Y���.W��Ŭ�U�
�/�n�x�8^�4�*PPu1���&^��pY�b޵|�sm#�PN�.-`@����o!ض���uR��`����Oz����s6h�  �R���q�&H�V�^�B�8\��H_ߍ X�5u��
?B��HHj��N���h����>:�pA3$�q������u����b�#�&��';���q�f�^��t����6�Ӡ6c*�����^a�2��ZEЃe��X����	P5,��2&ͪ�b����Ǉ#�<���`��Y�������f�]��E=��C(���y2D�p���B�$�lj���-Ȝ�)kV�T�ڋ��f��o����׷��O*RjR�`�j+�n���&�6'>(��z<,�J���������-�@��#�~����S�+(Ku��`�!j��X���	��L�D���<)p�)(q=]�Z m]��e�ʂ��J0�
���%ͶG! IB��\�ٰ̂��f�o!c�s &�]0�QX±�:���-1k�.����? j�咛I�}�����@��&Lz�$�\hߜ��Vv	EUZ�N+t��������hy-,�����ڸ�6/�~Hն�9V�����)~|֌Ⱇ7�5W3h�zTA���� '�CT����T�v�sX��.��:�$v�������oВ�[�qve���J��HG d��qQ؎X�m6/��~�#XXބ%�n�|*�m�W#~�� P/m�_�1u� )����F�3� �V����rP	V�J�Q6����:�`���Җ)8ۺFn)�{���h76CdZ%������*���]��P��CV�<i���dU��    NE�-l
����D,(߯I/���l���!����S�&�K�����͛ؗ:"��*�]_�bD�fX�뵾��il)�7���f�� �'�����H��%?Dr0��@8����A)�j��g6iD� j�a�E}��z^�˻�ذ�\��`�@�Oyv+q��+��.
WԤM?���]�8���>붬�p��u��XY ,ǁї0�
@4�Y�(��L2��F?�Ѵ :�F��05,n3Y�rؘ0)��֋U��~��{�4f�ڴA901r�A�d��WW��Ի�1����4�
r�O=\�݊Y7К�e�5�5A��������yN3 T!_9T������H횹����oߧi���f�!����5$�K����xƎ΄�L�Pv7����޿����~Z�7�������1aN��!�k�h69r0��@�������Ս�aG@�ޜ"�ۥNش'�8����z��F��iY�K���a�U����`-~���|u�l���>��ϯ42���Q��|�I76�p��:�H�.z�1�J��EcmY�[a��w��J�Mf(�G�%�����v�Q�Z�V�k��W�Ɩ�@��, ���i;�V�rE8�
ukn��p˱ Y��␫�J@W}�[�6w+	Z��J�ӑ�A���H�.V�Q�A��ф�����R��t����f�ꂪَ�k����q�q��@�f�/�f���gn)4[%������c�!c2�
�㖜���t[���P�dֻ+$�V4��}֠� �� ��}�~Ug,�/d(,lV퐫+�JcSYgB��]���G��^Ia�4�}��]C2�Z�h���ݒ/Ҫ�X�^\��;b�f��ȂAF�t�Z�+��k��e�����
���3�8�}JmM��	��PHZ�f��P�U�M��c��sOq!���k$-|���jk��\��!�!�=�g�M�8B(>~�-*���!2�F�� �>ָ"��f] )�.)�rJ������L0�uB׽���b1V���,��ђ�+�>�˸b�d����b���x&h�e�j��U�яϚý���^�����*���x`�ER��9����gX4j�q����^gȦ����+�'�����_�=U�HHs0����W�����l�?�R���u�l��}�{J5?'M���|��u4�$,-#�a�2�s�y�8%p�ڣ�5�Oq��.)Y .&�!QC��%�a�7��j��I��؋O1�!9��P��\��/i̳W��q|�-&S� ��<f������uc`%<���&�q���Ih��*MM���<���iNh#i'���N ��Ⱥ6�v2XxF�l��g���t$��P���A�F��o�����튻�%n�����û1vU���үP5y�M{�䑦��4�}���%��`�m��q��aYZ���j���nP�צ�UK��p�JZԑ¤�Ve��i�h��i	���p� �m(<Hj��y���l��b�6�E�R�}�Ե�ˎЈs\͓4�Z��M�������AՠFօ����A�
���O�>���c�&�C(��=�Z���$�BU��e�>�6s��k���.$[��i�i=�r����C��T=���Ⲹ�ʌhΟP���lC<�sk�p�h+�������CPt�F6�緝����S#�[���	�*��`p�+��f25�\c[��,/��|�v���47���.�o�2�2�
��V�Ť���4R��b�G{�rCih��B��m� zS�4��j��۝�}�!�Ǭ�o4�P�q�`Kx7��N������0�4�9r����p�̶�q$���g�
~���� %�4*�!��q��}��)ؖB<���M-��p�����^9.X���2��/ТiIM"��~sC��v��eIZ��Y�:5̦�t������ۨ �~��7�y@B�f���Jjh��e=ͥJ3,��.7�	��Ita�f���_���T�����ˤSCIcw!�s#9�V��;���quχ�43�V��R� ���W@�݆�^��C�բ�Fh���X�����45�u�����n��Jo@Z6v���������C ����x�ii���D��z0?H�C����mh[a�6s���g{�����R���z�������2+P�xBza��͊��/���J��N���<F���	������g�Ӿ����z^�NBDvk~�*c�ٻ����]�L�\�b��y�B��x�������(9�O����?@��W�Xx?U�:+��Y���*x;�����=Y�>��e�U�i��[+��"�l�
�[�A%�J�UO�N��9&`������m�V���N��,*5ޑYB�US�.�pį���9�����'�k�g� ��H6�MT��{s!����z���Ff�L?�� ��hY~2U�\_�öPU�V=7Ai�U#w:W|Y��n%�f����X/ɇ��Xl�$�N����!����Ǚ�cW�F�5+.�#LU�z�Ch��j����7���Ju/�U;��z3�T5�ro�'���*k}�m�;Rҽ�Z�5f��i!�
�gf�^%��n�H�V[��E�,�^�O��\gPviɯ^��oޠ�ڸC�N�Iʵ��2O�{���HI=T�j'KEο�'�(5#�:�Q��#$Ԯ��*#�v�@�$¸-��US���`e7d�ó>�&\K�u�08ĤSU��Ǭ@x$�O��t,>�~��M(_��gCi�xGfQ�L�����غ}��B���M>�C&5m�m&����Iɢ��H�p����N-9/#�RM���Wa^nUI����Vl���Թ���\�p�a<�fN���|�t��_L�v8Lʭ�-�ɺ�{?|o��:�l6C8�������4{��f��ʏ��MH:!��~މ��ςG�O�=N�ʾ�$;���p荏rqݎV�7�u�������L�kfrr�����o��'7��m ��l�X�ەdLBvUN�#i6Z�*���,g����EF�MI�F�c�p��������rAW+��,sA�ģ����P��i��ƸAY-�8�V=dS�'(�ȭ��<$��QCX.�C�)�X���N��9�k��p�R$\��G�ް\�U���p���q[Om��BT�/�LI��'ݶP�����Z���e�fY����f�g��B6���jR�#��%}N����å�5��T�5"8�]Ջ���QxE�X�a�����v5FMY'�a֊����m�r*ن2º�F���<�-N�:��9�x�I@�-/�� TT̈́�5莓�LY���.��<�:my�^�s쳯A� �꣐���&�]��qq"���­��-ͻ�Tp+�� 1iJ�-����d�!@��E �3��$J�#+f}%Z>�Vh��������J��Nkr��>�ғ�ށ{�z~� ���Vx.$2z"Muwj!��N�I�e�ֶ�I[V7;Y9�D�����Hށ�>�D��x'tV��X�z�@A�?�ߒ��uC�7İ2�2qS3:��Xȸ�4;�[G�p�� r\uyS�b�1��}��<����'	!��ͪ��jnT��Y]jAg��/j���&D��5��E,l��T��jq�Y�������-e�<Y�^Ҥ]q��k�A�V7���iZ�#Zb2薁 +��������B��/���d��(��_Td]MN��V���c�ű�C	�ДT�YЙW!�άjW��C&_��F]�µ��w���5���UW�{�U_��Ő�/�mH`ɍ+�߭�F�D���ʾhը�W�`B�^��%�PeN.z�^c=j[��Z*	H���"p$ �R$r�G����L�U�`��U�z<*�[vm]�#y�D��Q�*��+d2|�޸�~g�����v�:*d/��H�瀺`I����
��Ҷ�AX\��Gͨ!t��C��M	*�̞x���������2)hݤ�,�SV�1 M��[^��k��A+�D(wA�����`9p�^�Ɋ{�ti�Y�W������Oo�`"��+k?��5��_��
�6 4	  :%k:�OŚ�5��E#�����-��04���{T�4
3�C��g�b�l���֏C�bQ�IU�-�}6ٍ/]6+���N]bu�5D4��r�9��ǆ�"�u �x�4U�X�?n���h����Uu�,���cFi�SՂ�cz�%SJ�ٶ�r��Z�����z��a��.��]�ao�.r���a<m�\#�uF�/[ض� 	yjzV72x�A�.�#�]�`;��2��jp��G�6�s�حc�{�=���#�'<oRr����~?���QW2j��iwިD���O�$P�\{��w�L�x�g3s���v�㑜+��~��z�uw���	�ڦ��K:ȪҲ�J��ďtH�G���賫�˺]bѹMƚT��;��ڛ�t;�l�.s�~{lF�	������q���-�]6h�k�P�F(��B`�8�=����%�ڞ>�͌6�Լz�%�"��{N�V&�ʰ���_����X�^���Q�m(�|9��/g(����H�~s�No� Nc�\�*%t�˞��ɥ ss�����c`���Ri>�T��渖�{�T�w�ًj�d��F��U�^��ꥦ��b.,�ˬ餹�9����!N$�͜�:�����q��K�ۋ��|DIq��}�2Xid�RTA&�V�aӜ����hov����`��Ś4� s��U��V]�#��/��
�/�̽��~-+��Ey�q����Q���x��+�ܽY�N.�˜���E��o��҂�Fiժ%�Y|�����W��9?R�˚���-�<��u���9�nC��&Mm��o�v0ZI�p��j˞�5Z+VS�,���Ý%eJhZrO��q�:x�xoI�.Iz(-ꁱܡ.IG!zI��/��+kf	7�ě.����8⾰G�`�B���E�>�D
���E�,41m/�M�ؠo�-�<���D���&1�F�F��_2h��6�#�iNN$�����piGx�`,���Wǥ�C(�4�1������9�-� ��bN#�������Hy��b��ێ=��?�(~�YgdH�ݞ�)�5UXY��1��H*	��gh͸�p��p��x+��*���&��&H�;l8��A�,*/qUÕ��Aa�Af��LӘw�c�MNd��BB6� o����
{�qTd��f��m�>�`���Mu,*�IS���j/ً��L�K����/�ؓIa���I�ã�^��+�̇
M`w���w��g�𲌫�/�������^I���C`�Ts�s�� ��m%�j�`S���3����]���j���2�p����ACU��Ut�io�L����@uh�=�wJ_ �'YS�Jh��3����Ŗ�_aŕ�3�M��H�͑H��m�x��<�a)콎�m�}����vFQ�V2����HW7w>)�{A��e��R��5��n��l�g���T�!xqj���������~����s��# ����g�i���cM�tsJ�T�^��k�e+-zу+$�t�l����Q�,/��h� {<
�O �Q�dL�V�Z�B+��M�鲠�P8)��u>(Z�T����U�3��!t$<km�Z�� �V�yD���u���dl����.��K���'�k�Q�7�w�b<ĉ��+F��][��ɜ���?��Q���d��U2��8����o�V�
�V�3.��s؋V��h�,�/(
�J�E�1t+ڭ��Yɯ-�S��+��1ҽDf��,���1Ҷ�GJ�ʆ�i����V����o�P��:?�?��VP-	�|�'� �����e 尘F_a�7&z��<9�VF�F�6C}l�䎂W��{�xt�������Hl;��e�A-yS���Z�l���V�l>����������'���Oe[J�:&��r֛a��
s;��h��95:�ٻr��G���A����jCp��<M��gu���YU�-�#'k3G	M�.��[�=w��_�4�z�nP^� �h5q:�_����ʭU��;�|��6{,�A�g���P�	*��־
Z����]��i�{BL��\�]#�g�/n�+ωZ��/ �3�#�ۡ�)�3�:��C�&2�1�{�@����x�ur_;��YE�+��X�=���R�ocu���ek˟�$�W�XQE4���f�����h�2��mn���ߖ�ݎ�Xe���k�c��x�Ncț/�r��e�c�)t��{��h�-^�޼�8"��&%�׷Cӈ|�p��вK���MPñb{X&�������5�d��X�A�=n3�QU4H��ɞ�qĹY��LZw�2B�BӋ �����������������а      ;   H  x����r�6���S�����8:�D�����^r�HX�E*H�V^&3�^�>��낀l}0eǙ�g�v������ќ�"�C<�m[��#���0��`��%�Nbt�d#D�'kcWB��a�ExY�"uT�2G�~���xħ�Ç��\r�j�-f��D](JQ� J�D�EWJ�j��
��.Q�6�'x%E���b�!Q��y_���T�Z"�@���"�B�[6Ccßx�k�쮞�;�2,0��#�� %1�X�9�!�\IS�̳xch`2��c
H�Y�|a�O���y"B�#X��J��\�Jb������%L��{W�P�.d��+me#9��u�'+�+|�0zI��� �cm���]_�� ��픗|�g �@:1c�2��g	V�Z>|�,���H�u�-L\�@5��
O�ڮ-J}v�qh�Z�;���w5���RO��)E$?j`����3r]�J��mBz1�v0h��gh��l^��x­0PEۂZ �"�p9��zO�=4��o5�+mWЋ�B�e?	���b(��O!���v,��%�d��˛���c�|+��`�F��Buo��L��'yh��~B�CX�I�p�j��z�5ƬAHp�ʉ�Mˡ��j��?%C����AO�[3�J��cw�;0��]h@p��э6���+��r�Fb/�e��3��#@��O���Ϸ����c���Ȯ�*�b�a�oZ|�iѱO���p1��j���\� Xw5�4	��^�V.�u�k�B�dSZ�z�i7�L0I�CBy��{z�͒׼�q�]L�xh��6- �Rm�*bj6/�#;p�`Q��Q����*���v1�R�!i(+�{co����~v�팷g##���k��з%񸟁,�4NЄ7�[ޖspC`�Kʠ-�#$����B�b��j7������	%�St�j>�5(�گ�W�W�$���i����O´�g�6D�,,�m�t;���g���)8�<�L���!���h�3�Ⱥr G[$��^P#��ԣ\�U�����mk꼚�H;�,e�Ua}�5�|v��A�~���9Cw�?���֙Ҳq�M}���9U7�4|)�y��ha"Fښ
v��[f����P�	[tėb	>��;	n�� �V�l�ގ�l�]q;�Tg�ʺ�v�p���Â��c[M��6�h�s���P�.��*��E��}�F�5w�,�W�?^5Y�] �e�]U�K�$�9-	�F9LL�_,x-��͋�+Ygn{ɲ,`�5r&�a�q�x� w�gf���&z�]�%I�5�y!šFlO���AU��!Qgu��`&�{U�ȽTw�F(�>��
��`�y��
O��.J�d�����u�+q����D��}wo���������o����
�}�e7H��y�������� T@��χ��+sgte��A�Ct���dʏ!6%�1�B=w*!�S�h��z���'=� �Ug}��z*�?��{ŃT߽�����*#�=T:H�(�
*��a>H�)j���z��1To֓!ToѣC:���/�A�������>T�      :   m  x��V�r��]7�����]%�f��kIʲ��RDǩre3"F$L��h����/��^e��%߈��T����>�4$�?���y���ojO�⋦�7.�,�4�]m;:?��fo���t�6��v���|�Y��|(J��oMۚэk��t��L�;~c�f��n㛘'����J����Rtt�C� B<Q�$���z��
O�N<_ڵ���|��`]�wuL�㱻��T)�:BMe���i�b����������N��y�F%�̪Y����/�Ύ�����!��T� Lz��9(���ڍq:4[͵���[�'S=���iBg�͖��-+��6����B�~���WU�����3EQN�zׯ�� ����=[�v����땦Le�'��f��QQE��mk�����*�����kߢ힮M{o{���J�>8�6HFd�P�B��c+�FyV�QI���7�;�4~�7�?�I*�j���7�C��|9��ѵT|���gz�����	_u���w��5�'t�[�k��Aw,A���`���F��8/h���	��*�3�媒�tg��s4g�6���-��3��6�Z�.�������|��֢�*����M�̟g�+A�p	�l�����ڙ�/����g6�z���.�n(����&ƵMjeFcd�D!���*U&�n�>�jO�=�_7!�v����z�խ���M��tˀ,�-��z�]�\��:Bϫ=)��)���э����/!<����~��q�q�v��XX�D�Y���[�QR��<����)��X�H*zkv-�Eh��}��6����7�攋���NT-���#�z͹H��,#���+����]�К�AUP�N�m �&bغ��� _'�*Kš�9M�Ń��'�|P<�Jq�<FF����<01]MU!�<r�L<�LU��8���>��?��z���A�m����C�	�΂����]��2I��A������D�ȟ������ہ���;2NDz�w��6���h�/�Ez������p�2i\��q^/�HV����ݢE�A�al]g܎n�@�[g��{�c`b�GD�wh�3<i�����F%�;u.�gkNp�˴�"4ljV��Ԉ@��H�/`c<����SW��DB3�:,��/{G`	o��4�u���\���`;z�BG����` �	z���TJ���Bf&�G��k���<����ƭ��]��l����k���ыZ������^��>_�~��@�+]5|��p[8~�q��z�1�Cf@*Q��M7�h�"((E��8����Z�N�ZC�@c\���y��Ѧa^�P�&mӶ4�՝����@H~L�"=^EI�G�ƣ�I��1kx�{�a�k�x�n�R�cy�b(v�u(F�gň�+F����y҇��p��ؓ]��)�,��[�:K�:r�.�g����hUD�0o��-l�|x;��#%�);�|��8�bHx�{�������!.�t����z��)�CO�'�A��vY�E��w���+-�"��2��2+���r�odY��9}�G��|����z��r��M���%3.f�ϵM*���e"�tPVg�x���D͏Q�V6�=2���,�1���qE�B�     