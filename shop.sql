PGDMP             
            y            shop    13.1    13.1 C    
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16394    shop    DATABASE     h   CREATE DATABASE shop WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE shop;
                postgres    false            �            1259    16476    status_orders    TABLE     d   CREATE TABLE public.status_orders (
    id integer NOT NULL,
    name character varying NOT NULL
);
 !   DROP TABLE public.status_orders;
       public         heap    postgres    false            �            1259    16474    Status_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Status_order_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Status_order_id_seq";
       public          postgres    false    215                       0    0    Status_order_id_seq    SEQUENCE OWNED BY     N   ALTER SEQUENCE public."Status_order_id_seq" OWNED BY public.status_orders.id;
          public          postgres    false    214            �            1259    16487 
   categories    TABLE     �   CREATE TABLE public.categories (
    id integer NOT NULL,
    c_name character varying,
    c_slug character varying,
    created_at date,
    updated_at date
);
    DROP TABLE public.categories;
       public         heap    postgres    false            �            1259    16485    categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public          postgres    false    217                       0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
          public          postgres    false    216            �            1259    16427    images    TABLE     �   CREATE TABLE public.images (
    id integer NOT NULL,
    product_id integer NOT NULL,
    name character varying,
    created_at date,
    updated_at date
);
    DROP TABLE public.images;
       public         heap    postgres    false            �            1259    16425    images_id_seq    SEQUENCE     �   CREATE SEQUENCE public.images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.images_id_seq;
       public          postgres    false    207                       0    0    images_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;
          public          postgres    false    206            �            1259    16446    order_details    TABLE     �   CREATE TABLE public.order_details (
    id integer NOT NULL,
    product_id integer NOT NULL,
    order_id integer NOT NULL,
    price bigint,
    quantity bigint,
    total bigint,
    created_at date,
    updated_at date
);
 !   DROP TABLE public.order_details;
       public         heap    postgres    false            �            1259    16444    order_detail_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.order_detail_id_seq;
       public          postgres    false    209                       0    0    order_detail_id_seq    SEQUENCE OWNED BY     L   ALTER SEQUENCE public.order_detail_id_seq OWNED BY public.order_details.id;
          public          postgres    false    208            �            1259    16454    orders    TABLE     ^  CREATE TABLE public.orders (
    id integer NOT NULL,
    order_number integer NOT NULL,
    user_id integer NOT NULL,
    total bigint,
    payment_method integer,
    status integer,
    fullname character varying,
    email character varying,
    phone character varying,
    address character varying,
    created_at date,
    updated_at date
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    16452    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    211                       0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    210            �            1259    16465    payments    TABLE     a   CREATE TABLE public.payments (
    id integer NOT NULL,
    method character varying NOT NULL
);
    DROP TABLE public.payments;
       public         heap    postgres    false            �            1259    16463    payment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.payment_id_seq;
       public          postgres    false    213                       0    0    payment_id_seq    SEQUENCE OWNED BY     B   ALTER SEQUENCE public.payment_id_seq OWNED BY public.payments.id;
          public          postgres    false    212            �            1259    16408    products    TABLE     �  CREATE TABLE public.products (
    id integer NOT NULL,
    product_name character varying NOT NULL,
    product_slug character varying,
    product_quantity bigint,
    product_category_id integer NOT NULL,
    product_price bigint,
    product_sale bigint,
    product_description character varying,
    product_thumbnail character varying,
    created_at date,
    updated_at date
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    16406    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          postgres    false    203                       0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          postgres    false    202            �            1259    16397    users    TABLE     D  CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying,
    email character varying NOT NULL,
    phone character varying,
    status character varying,
    avatar character varying,
    address character varying,
    password character varying NOT NULL,
    created_at date,
    updated_at date
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16395    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    201                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    200            �            1259    16419 	   wishlists    TABLE     z   CREATE TABLE public.wishlists (
    id integer NOT NULL,
    product_id integer NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public.wishlists;
       public         heap    postgres    false            �            1259    16417    wishlists_id_seq    SEQUENCE     �   CREATE SEQUENCE public.wishlists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.wishlists_id_seq;
       public          postgres    false    205                       0    0    wishlists_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.wishlists_id_seq OWNED BY public.wishlists.id;
          public          postgres    false    204            a           2604    16490    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            \           2604    16430 	   images id    DEFAULT     f   ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);
 8   ALTER TABLE public.images ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            ]           2604    16449    order_details id    DEFAULT     s   ALTER TABLE ONLY public.order_details ALTER COLUMN id SET DEFAULT nextval('public.order_detail_id_seq'::regclass);
 ?   ALTER TABLE public.order_details ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209            ^           2604    16457 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            _           2604    16468    payments id    DEFAULT     i   ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payment_id_seq'::regclass);
 :   ALTER TABLE public.payments ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213            Z           2604    16411    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            `           2604    16479    status_orders id    DEFAULT     u   ALTER TABLE ONLY public.status_orders ALTER COLUMN id SET DEFAULT nextval('public."Status_order_id_seq"'::regclass);
 ?   ALTER TABLE public.status_orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            Y           2604    16400    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200    201            [           2604    16422    wishlists id    DEFAULT     l   ALTER TABLE ONLY public.wishlists ALTER COLUMN id SET DEFAULT nextval('public.wishlists_id_seq'::regclass);
 ;   ALTER TABLE public.wishlists ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205                      0    16487 
   categories 
   TABLE DATA           P   COPY public.categories (id, c_name, c_slug, created_at, updated_at) FROM stdin;
    public          postgres    false    217   jI       �          0    16427    images 
   TABLE DATA           N   COPY public.images (id, product_id, name, created_at, updated_at) FROM stdin;
    public          postgres    false    207   �I       �          0    16446    order_details 
   TABLE DATA           q   COPY public.order_details (id, product_id, order_id, price, quantity, total, created_at, updated_at) FROM stdin;
    public          postgres    false    209   6T                 0    16454    orders 
   TABLE DATA           �   COPY public.orders (id, order_number, user_id, total, payment_method, status, fullname, email, phone, address, created_at, updated_at) FROM stdin;
    public          postgres    false    211   �T                 0    16465    payments 
   TABLE DATA           .   COPY public.payments (id, method) FROM stdin;
    public          postgres    false    213   U       �          0    16408    products 
   TABLE DATA           �   COPY public.products (id, product_name, product_slug, product_quantity, product_category_id, product_price, product_sale, product_description, product_thumbnail, created_at, updated_at) FROM stdin;
    public          postgres    false    203   fU                 0    16476    status_orders 
   TABLE DATA           1   COPY public.status_orders (id, name) FROM stdin;
    public          postgres    false    215   u       �          0    16397    users 
   TABLE DATA           r   COPY public.users (id, name, email, phone, status, avatar, address, password, created_at, updated_at) FROM stdin;
    public          postgres    false    201   fu       �          0    16419 	   wishlists 
   TABLE DATA           <   COPY public.wishlists (id, product_id, user_id) FROM stdin;
    public          postgres    false    205   �u                  0    0    Status_order_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Status_order_id_seq"', 1, false);
          public          postgres    false    214                       0    0    categories_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.categories_id_seq', 1, false);
          public          postgres    false    216                       0    0    images_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.images_id_seq', 1, false);
          public          postgres    false    206                       0    0    order_detail_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.order_detail_id_seq', 16, true);
          public          postgres    false    208                       0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 10, true);
          public          postgres    false    210                       0    0    payment_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.payment_id_seq', 1, false);
          public          postgres    false    212                       0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 1, false);
          public          postgres    false    202                       0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public          postgres    false    200                       0    0    wishlists_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.wishlists_id_seq', 27, true);
          public          postgres    false    204            q           2606    16484    status_orders Status_order_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.status_orders
    ADD CONSTRAINT "Status_order_pkey" PRIMARY KEY (id);
 K   ALTER TABLE ONLY public.status_orders DROP CONSTRAINT "Status_order_pkey";
       public            postgres    false    215            s           2606    16495    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    217            i           2606    16435    images images_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.images DROP CONSTRAINT images_pkey;
       public            postgres    false    207            k           2606    16451    order_details order_detail_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_detail_pkey PRIMARY KEY (id);
 I   ALTER TABLE ONLY public.order_details DROP CONSTRAINT order_detail_pkey;
       public            postgres    false    209            m           2606    16462    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    211            o           2606    16473    payments payment_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY public.payments DROP CONSTRAINT payment_pkey;
       public            postgres    false    213            e           2606    16416    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    203            c           2606    16405    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    201            g           2606    16424    wishlists wishlists_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.wishlists
    ADD CONSTRAINT wishlists_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.wishlists DROP CONSTRAINT wishlists_pkey;
       public            postgres    false    205               h   x�3����K�, �FF��@d���2��I,(�/�́P�Us�$&外p�@(�L8��S���2S�9���՛r�&�(�'�$gp�غ�`6v�1z\\\ h5%      �   D
  x����vں�?�w�>���.������$�O�6=i��/��Ғtu~HsYD�Ԫnw��������ԉ���h�&������_�_w+�����Ƿ?r�9d�Lq4�(��c�����3�[���M�K]um-N���P��Dw�%D�sQD�CQJH��&!Wz�諶?vbW5��S�V	�F�ʉ��%�3�S��`�F�B��J!�^�	q�VM�keť:���ܱ�A�&)U`�����8޼_�I��~���h������Uk�CR�.&ő�H&ő�J�]"yZ�G��K��'��� 5H:a2 P6���.ů�#ʡ�l$qn8����q�E8��ph�Z�<©U��}m}��5p��tP[�  �Gk @� @�Z��������3bZ��0�^HC�ń0�#���&յ�4IIn�S��|l�}V%2:��`L.	Y��\rh�rI��>[�P�a��W�X9uٗ��֊OE�y�|*��a�SQd K����ˮ��=�/%�	�e�sY�)�\��=�������S�}u<6[���o]��$<�g��&R_U<��wS�L!c9R�B:Y�$�HU���%�� im�ˑF�$Ҕ#�N�Җ#ظ�E*9!���K���Dr��Ȫ>]��C������5�2u3�s�������TCVXeT/Pu��\ㆪP-	�}�J�T�]��!E��Z
�ɵ�T�k��^m1�F.��%��
�J��ZF��k�쫞��]���N����S}��4�u�H�.��U�ʈ����x_��,���!��i�7ۦ�s:�m�#fwjw��TU��LD70*�ݟ���t������-�����\���Ǆ����P����`^�؎!�s(�rQ�P�����\ea�����|r�l�8V�n�Ҏ��>�7u�G]4%4d�hKh(�DWB�?v���"�Ak���'�z{�z���`'��9��H<�����]�2���K������;�B��`R!����3ViJ��r.� ����6A� [�{�Uƒ\RE��>)��@ɐ�G�PM�Ib�pӏ	 ܁Ri J�Jъ惟f�Ew<�#A�_Q�{u���ؔ<��p�FL�_��b%^�-J�~��|v>~j��w!h�ݱ:m�?����5n�	d(��*NeD�Y��2"�5뮌C�q�z���t)���a>Dٟ��m��f���@'+޺�G�o<a;��fa�l���f��I!__Xa1-�e>�m��`�����~>X0�~rZ�Dɳ��B�|-�>��mkZ����r8�$m�ñ�:�Jw/����t�t������B�kk}X��k��Mu�>��ξ�P�t\�hٍ\�背Zv`Z�c�����p�J��k�6I�1��ө�70�o�����EmL��t�)uЪ�{�S���/ѕO=~P&�D7ZQ_�۠\
o�~B�M����y1:�]ˑ�㑻�Y�|�cv�8���l�D_Y*Ī�}{�˰f�'l�Si%�Bl��Q��cK�ܼOtV��i.�[xt{c��D���ҬϠ�Fņ
,�6fP�o�P�̠�Y֩�B�8���ӻo�s!Kg�`%s&���l6�e�������ǆ�0�z����v����x�\8����84����ж^'v��m��|ޮ��&����(�Z�����U�[�������F��`��,�@��Ł�	����1�ڜa<�I�ʠ�H�,̳��$�ѷ�Z�#�F��<I��aI[���m&��}[���[��l� �2�?G	ЪQa��4�烄���a�߲e�ۡ����M?u��/G"��P�Z�*��hP��Dv�y�_����'r�4���G$%��Y�e��C,u�J�XKM�$9(�wK0�(Ɵ��}w�{���Қ��<$�R4�u�v)9<I�����Y�F��S�J���[�t���Cw�����	��<�<���C���a؞ě�Rg�q$�t�q�+=�@G�JH���a��+����uw����ZqڽM�2+n����Ə�𠱔.�A�(S��0��<���}'�z}����I��%��>�v)���sH�|	I���G��\+����z�v������a����`�����{H.���Jj5�D�2�����z�k@C#�F��!� �Bve��8V�߷�%cDۊM����f��l���s4��C2������0��C����~����ώ�p��?����f�[���Z�a20B�ccx�37O��I����I��T��HnV�C���S�)Ā~�9�\?�0�=���69���R�p�����\8�YW���X������1bw+��$�x�;f�n�׍q��pU�vlX�̼�tl���9|:�a�����x��0��寮�`15ge>�ͪ|ԙ�|�V��`ڰ&��r,<|8s�0��C=T�����:��\��]C�6��-9Y���Se@�1�#cҮ}��Oⴽ��N'	��3IBFk�l����:�$�Oc��IB�)����:�D3l���<L��ݜ)�|%#&/������s�˅|�o)�L~F��Z����N��ko��������� �^�      �   `   x�U���0����0���K8���!�k��/?�1Q�����l�r��a�0z���]7��L��d�/�ZCT"ь��IT�9��.r"r� �         c   x���4426�4�424617500 �9�9SJ���-,-�s3s���s9M�21~@�eh �iT���D\�0��f�f0;q�a��h����� �"�         =   x�3��H��P(�?�0O!;#S!/�᮵y
��s�H���pw{�B���k�b���� 5��      �      x��\[oםf>��>�X�23��o���i-׵T'-�2Ҝ�8C��R���0�D(�E�E0�n*8NR�P􁪿��I�9g�������-�̹�����S��<���C"�ppu~��n8H��q���@����s���N�M,�GV4�!��Z�����C���+�S�;���U�ʂ��%.���Hz"�:6��ŷ"��%���O#��	}�c�H�|�n�;=�����Axu�Gџ}�'��ş����3�@ Ʊ?Ji�"�}}cf��@L�_��	,�������&������������pп~��HBXfk8�w�bzu�4�O�.^��o��Lg?�`�?���s$����R_����u"�W��#�)�4����f�ȎOy����R\�q��R�n���w>~�E�X��u�	��s����`�7�]]���(�;��C?	��d������j��!�����ݰWqmױl�������sb�a��H��v�g[lԷ��ۀ�tA:�A�Ym���o���VWrt'�m�a�|�N��d%��Pz^�D8H�W�}�ޝAڅEQ�Jx��r"�$�Ɖ�O�2S�0��[�G!�R����/S\�i�)���)��x�,�ݥ����=���� r<�aS`��3���*����J�2&��R%��� �}r_��'U����'�<ٞ�O,���r'b4�b��>f)	i5 շ���,)>�Q�6�a�ߩ��Ǯ�'������Ď��1�o�}k��-�q*�̸���4�$�`� gV�) ��F&@� |
�!ۋ�p�$����q.9��Ф�#0�@�GdT�Dr�Â�l��B��Y��0�����Sy�D�.��.��7���2#8�@��� �|�Ӓ,M��/@���#1���4�x*y�,,�\�H��R�s�p���㮸�x���S+�O�O��1_�g5���4!�z+��E��H"j
��n|����c8��!%t��t��Gh�ػHe�+��	�s�#}�-��Z���B��߀Y���=�;�	�;0?o�(-KT,��\�XK(��Q�~4��x�؀a�a���u<�o`���q��#wJ�/X@�lz�?}�s�_��	�r����K��C2��u���k���Oidu�!�����r�8}V��>��$h�������(P�)��i��B�L�o����+��%��c�!��^�#���f!��ˀ)?S��ନ�
�E�l�i���;�Ą�����%7�}�yLM�1.���ǰF�jU��U�-1�j�(��o�J�aX:��I�O�ڐ{��!�tl� ���^���xN�DE��H�:.;�^��,���˵:�����\%�h\[��DB�^ܸD4xtך�#  l�+.�R�1�HW,���ۉx��{�0��0�}>1�/U��`�V%��U��>fh��]�.�� sh����}/����s!�!GJB�,���<��n����#��&G�q1�>`g�=�FB�)1�'�60��FV^/���7��0Ð_�M�"N�o-	��EE�wkQ����-��n�#����
�NB�����L��hr"�oGd��!�a�Z�Q��,m���A!�|���h)o���MW��͂4�W;�H@t��9��qЁ�2�n퓅 �(<�~�_�P��+��1D�m�� D��gGc�-�h����q��p�-1.텢��k�K�}����۝�壆.ų���)<������z>��oҥC�􅨩�0��H�R��lj>�M��D���q��@!�.��I�ϲ
1L�a�0�ft"�'�G���N2��Q7E�,�(�`� `|E�>���&�B�W�t8�ג�~���&���;q�_�>`&��4�h|o$QO���	�똂R���f��H��б���E�fU��{<�:e�Bb���$�k���MI�!���	1��;���]�i��M�t)�
l?�B>�V��)zUI` #�Q�*$O�a2��Q���2�pʡ����i�9��٘�8M�~��s�p�|y�c� ���)��\���{��?���"�a�Бё�OD����$Pt��X(������0����2�p,<��Q-QPs6Я��W���Nl�ّ�|�E�����*���s5���{"���`���O"-��,���:�]����f�9�HB&u��c��N��f�n<-����<`1�kZ`��3G�
.e�a� A`&�� i�e�T>��!4PAR]L͝����f)�� �"N�.n}\�H^]��j��?��� ��'�,Z\�Хc���]��e�����i������4���N�r�����;~p}08�ܺ�t��.g��4��q���>�4/���Nڃw�̊	�v�	c���l��[�n]S�Tɯ.~P�+� -%�"�P{��;��ȠK�����F�e_�%L+����I�����ߪR�����	�SY�#�>;b^Γ�hu����׀��o�\݊FW��rՏF:W�5��n�-]������v����дd5�M��;�6��x�2�������:6�L>��\'J�g�=��Sb�sb�ˀ T�1�M�S�SP������k���9�m0��7��x ��{���MGѡ�Q3cO���Ѡg�q�ՃAr[Ēz�%�f�oݶmg��|�RĮED�\��6�0�,V �'�;�������$��ō�����R�F�U%��k�VYs(D����<*~������֊d��ᩮ47(>LB��e��"��L-��: ��,ԥ�\G�c7����?����mM:�5��,�
�^��v��%����{;ۿp��G���F�
���T�t^cLQ-��@��N��D��(<������&T8P��a�DJ<`�e�%s�X%w;��>/F_cL�O鰄#���������Z�Q�;p��v�i���`g�`Ķ'Ox�=�͞g9���3��-��4�M����֮��4���C��r�Z$/-C^�,��1�9\�(ľ��SCQf�U.}��1�8��5�ǵ��i�H;�ި�됷�Hs�� �K�x��ܲ=��}�^���Eqh{Hj��&����bQ��a�k�q��bѮ�{[;��<����ɝE�-�7u�n��߹fT#����,�B%c5v�l+p�K���LV�9�]L�e�V{�3�tG�N�Fh�G�+��և�W0��!��x$ ���ӚYUhΨ���\��.��Y����Ĕ)��L��|UE�%�wnm��yg��&��k' �M���g� P�F�8���j'H�Q�����1'G�CZL:`CӳCl�<��V�i�wrl�핧}MV���uW�� �My�w�ЂϬx?�m��p�KNl��޲w��0�Sh8�'q��� ��]��c���Sj=����&$���`���ӳ����,j���]��H��οO��$f�|���8��:L��ҧ��-n�q�}r˩�Q0/uRZ�ah7��u�sH�N�^[G�\'���b{���0rn�{���0��_-��ߡԧ~Ir&��)��Y�
�,�a%�q�RkU3w�%�����9|�[��תWaJ	id�iL���/R���bL~DC!��B2��'s��|Sդ��p�߶�;��ͭ{���]�!���0Ū�WS<�(�CxI~� 8���m'��y����Pm`���\W1wg�}�/nwC4z��{�b�vCw}�8R���`�q�����k(n1�[0��l���]tK���i�Z��X��v4�|#��)n���|@Qa_�T��9e+��I��a��q��>���K�|�5pE�ss9G����d�[�Y����ԍ nN�8�D���[Y�bʹK�fj�a��0�{�fH�n|4h�2bK7"6�B냭_��]3��T΄��Q�pڍ*�g�F�𤋮hHU�n_��!��2ּ�uܱ��Yk�&�n,�/Ұ�S��������{�G����|��5&�9�Qwܟi��E̴r� �}�vWr�11 �  ��|�%���7��E���+q�,��AG&�vq�"��V����lGe�Γ����%g���_cq��Qm��p�RZG���Y��T�)iy >�a�*�U��(� �	!�����GQ���h�˶kb�B"%A���ߡl��n�E� �� z���I�qy\uA����ݬ}�n��~�3�n��GaS#+���,uI9N�V��Zsń"Y��i g������t���1ب
�T|.��eik�bP�l?����z9��WYK�,Ur�v���ďy\y*=Mk� �ߵ$˾��Z���q�Z�Z�������\K���?��J� ���Η��|�\�9 �V���B�������P#�g�K2���_R�Q�_BqF���(�����1"j�%f��W4���u/���	,�d๴F��EQZ��� �aϚ�	���qW�b�Lx��9�.`�i���3v#$}�4=�sYzc%g=�WUS:��M�*On���,Ks%�1�d�K�f���@�-�ьO]\�I�U��N`#t@64�$D}[ů�fق�/h�Ojz�/�Ml_פ��s"\��EA<Z%�Q�����V�\*
-�6�o�0�!i:�9�Hl�[��Rs栘���T�Mϵ�AU�Er�U[�<T�/Y<ZT%�ehY��ou���Δ6ch��!�\�%��c�nc5��D�5�3�t��-cuWީj�YD}���.�{	H�K꧜	`���t
#M�v�x+Y�K(�EKh'�Z�j��aڪ���e�o�����E΄��/Z���8_`�M����2>$�nd��*�ˀ'�S�1Em �R�+ՕII˲��9:�=�5��,�z��H�O܎����(\4��>�"�S�y�Wy���`R����+�Q%;Z�ds�X�h�,u�����$��FI���O0'��������0̧$ؓ"cAe���&�
��D��۩�[�<Y�@ӱ�M���g���6�:Y��|��H8ϡ��x�-;��� k�]tX���H5��*�%���� 6�(��OS�o(�Q��XҏY u���;�x�5*$�#���y���F���TϜr�,�%G���%���@[^�b�:�7I���i��@Ʌ�W�銒�ne�c�	rSܚ�)F���ҏ'|cק�/�q8�o���t�&L�T�����n���k����V���cv��t���*��`�![o>�뺕ԏ,|����a�����GC�+u�ꕾNIWs�UU���ij��G���r�˧v�ݞx?����S4�S�z����	,Nj�v�VI҆���0���ؤ�ܓ��+~�]%\�*���_b�Q���g�?馃A��h�n0�-c�!̄�u5Y����3��� �vno�nv�&'�T_^v�V�OX��}�U�j����kr~ɲ�J��_��jG�Y���2EF+t"؂��D*Y�2:5rAF�������#��-k���s�����/?��֣���u�6�'o}z��޽�������|�!Q�a7���L�s	��k8��_P��]�>{ ��ha@�1���[
.���W}S����`�� o�1f�n�ʢ2�5��v"�`�^@��}�?К��	�"�7�Q�-�`���Ă 4+�qM�Bw���t���a/�޽.�FA
"}k��ݑ�n�vBFܯ%���T�A7��l�1�L� @|�ڗϡ�k�<�}�ˬhv"��/�KR�d�?Gh�s�E*�A�]g�C�!��<�j���%w+3��wc0�ؙ�y���u2�(��&�
W�� �y֨����+-$dK�8ѥ�)q.�_��j�1�];��݀����T�����U���ت1�<���չ?;�����uR�i^B�Խ~��ۚ��`Ⱦ�|y�.��	{K�݌��`fN��/����T�*�8B�71��x�4�g�7��BB��
o�ȳ��TD9.��69��X�f�m��#�WKC�%�j�Y���J[��ҽ�Q�D�h�{S ����]?��č> #�J� +	V����C�	N�� ��
��u�X=O�@o�큪��{�=&��ˢ�����z��B2[�C��)ݓ*x�����r=��`�W��S�� r=��E� @l�N�;_aZ$�央Q�0�/^��W��,����#��6@r�8D���4����{��at���`f��Е���˲��������{�v*�$�p��'�[~J����ְ������.ZF�GxS��m�ݎ����룬�C^A�1~��U#
����R䝔���?U!�ٹ����z�Oo&�-/�A��<K��7Ůn���E�<Z~	F��º�ąx�Kpp�YS���
]w*���
ͯe
9ǟE���>�Lq��Y�ipp1����jz�6=Up_�����9�-�:��Դ,�l ������cVNQΎ.�f�)l�Y�]�����y�x�.��|���5%�.Y+������{��UE.�l�v0�o�T̽.�4[BK:���X��VYu��{&��-�ES�w��8���C,����ѐF!5����(�x�D�JV�O{H$X�/�`���	�~EWI!ڬm���Wˀ�ӫ{�rS~������=�g���l��H���R���ފcJ;t|b�긺^[̝[�*b+�?�{�(���
4��4��P��V/�9�`�Vk�V���J�ɝL�:s��Ǽm��/�P��dU����-vY����N2tD�Ö�C�D����KB����|�V���&g�0��M�x�!eJ�e��CdsB��qԏ���� �Z^@�6�n�Qڼ�$�RLį(Ү.��J8��hM�Y�/Q�	L�7�0/�_&%ci5ID��M��i�+�E�:%��~+3����R� �bȵE��}b���/o�w��d�����9��{u��)eC��1!$�K#�o�J�t\��U}\a(C�_��06�:FΪ�!��6~V����H�Fy8�U����ŗ_�i�
S��v�D��L�T���IiIe�HA���#�Ү�H��`+�W�4\�z�5�*�=�1fݒq-aN���{䲬)^����F���qІ9n�b���(�Rz��0���i�Mq{�.����>4�O�g��>��}��3}|���\��oll����<~�"Q53�Fes?�P�Ӌ|-��6y�U�m��-w{�_AZoĒ����4^���0q�ik�����U��9J+ȴb�~R������i��Fh�	�Q��t�>UT�(�
ǱT%z���O]�Py䪑`�`$��/�d���t?�cǸ
�{�L���{���vW���Z%�M�?���
GDX\�L���8	�A�̲���
�cz/]���_�)
ugN8�`�2d���{��J��vWx3m9rZ��ih�Z���qm`p�ag�)��
71�knc8���^|���|�5��l�8�2-ztc��屟�X�		�J����VyTAn��G�QP��AV6ȩ��Ȼ���Ԉ$�9��'g�U^��4qZg���!WǔJ}��=J��:P�S��ZL{Ydw�Ƙҿ��s!߷�޸&c&l ��+����ΪyS�H���ⷱ�o��Kj*�TxA���B>C�V�S.�� �u#�=�^�pu��Z#��S�n�U�DK����&�ϭE!�D�n�S�J�nY��\n����ܷX�o0 �j$g�ΐ3�� ��d�n���(k�K�vݢ`�evBg��Df?�����7`EjK��y�+ ņ����NY�4pj�҆�O�x�Pq��'�O�[�be����k�SoS���Ĥ��W����(���mO=C��2^ �4�zi<8�By�PT���I����
$(6^�$�Ë��3��o� ���	��rb��u.7jy�?��%_zU�^����0����y�sRf R���j�6;��A��i�E<�w���a(_r�)�<u0��0��G%(��R(�{���;��/�۷         B   x�3�t�x�{�B���
yw���2���g&�+d^���e�yd���`.;�����\1z\\\ Z�      �   v   x�3���L)MNO40�4��tH�M���K��I���Q�����w`��_��ir���S��Q���o���K�O�k�{�Qq���~UXyXJa��K~��e�I%�.#����b���1T:F��� H&�      �   ;   x��� !B�53|�z��:W'���azB�Vr�N��吃�S�eT����T�	q     