   M S B A M L   `   `   `  ���� C  ?Blagodat, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:Blagodat.pagesBlagodat.pages      Blagodat.pages.MakeOrder   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     .localclr-namespace:Blagodat.pages       N� Title$  	MakeOrder��.��� 
������� � RowDefinitions �� $��50 ��� $��* �.+���  �� Orientation$ Vertical=�$��1��$
��Left=�.+��� (&Введите номер заказа�� -   $��IDBox���� -   $��DateOfCreated���� $!��Дата окончания��(  "System.Windows.Controls.DatePicker  -   $��DP���� $ Vertical=�.+��� $ 
Horizontal=�.+��� -   $��Search��$	��100���� -   $%��\photoempl\Добавить.png��$��20��$��26���� $
��Auto=�$	��200��.���� -   $��LV������ .R��� $ 
Horizontal=�.+��� $	��200������ *GetFullName+�� $��
PickClient��-   .��Добавить�� $ Vertical=�$	��300��$��Right=�$��1��.+��� $ 
Horizontal=�.+��� -   $��Servisec��$��27��$	��127���� -	   $��AddImage��$%��\photoempl\Добавить.png��$��20��$��26��&   System.Windows.Controls.DataGrid  -
     Name$ DG��$	��100��$	��328���� -   $��
TotalPrice���� -    ��Name$
 save��.��Сохранить