PGDMP         '                z         	   Classroom    14.5    14.5     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16401 	   Classroom    DATABASE     o   CREATE DATABASE "Classroom" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE "Classroom";
                postgres    false            �            1259    16402    science_class    TABLE     �   CREATE TABLE public.science_class (
    enrollment_no integer NOT NULL,
    name character varying(255),
    science_marks integer,
    CONSTRAINT science_marks CHECK ((science_marks > 0))
);
 !   DROP TABLE public.science_class;
       public         heap    postgres    false            �          0    16402    science_class 
   TABLE DATA           K   COPY public.science_class (enrollment_no, name, science_marks) FROM stdin;
    public          postgres    false    209   �       ]           2606    16441     science_class science_class_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.science_class
    ADD CONSTRAINT science_class_pkey PRIMARY KEY (enrollment_no);
 J   ALTER TABLE ONLY public.science_class DROP CONSTRAINT science_class_pkey;
       public            postgres    false    209            �   T   x�ɫ�0@��1�ҷ��`.��5���=���R-�!fz,�Ϣp����{��#M�X��&��_}���O��c �WmH     