   M S B A M L   `   `   `  ����N  JSensorMonitorWPFApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:SensorMonitorWPFApp.ViewsSensorMonitorWPFApp.Views  5   	   (    "SensorMonitorWPFApp.Views.MainView   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   T PMahApps.Metro, Version=2.0.0.0, Culture=neutral, PublicKeyToken=51482d6f650b2b3f6mah,http://metro.mahapps.com/winfx/xaml/controls  5   	   R NOxyPlot.Wpf, Version=2.0.0.0, Culture=neutral, PublicKeyToken=75e952ba404cdbb0 oxyhttp://oxyplot.org/wpf  5   	   3local'clr-namespace:SensorMonitorWPFApp.Views  5   	     � Title$  Arduino PhotoRegister��5
   	   $	��700��6'   $	��600��64    � 
ResizeMode$ NoResize=�6@    � Icon$5 //SensorMonitorWPFApp;component/image/sensor.ico��5       � 	Resources 5         ConsoleTextBox �� 
TargetType �� Property �� Value �� 
TargetType J� RenderTransformOrigin	 �� ScaleY��%�  &	        �� 5   
   " ��6'   .�5      ��  �@��
IsReadOnly . 6+   �� 5       � �� 5      �� 5      " ��6&   .R�5      �� $ 0.5,0.5&�6'   $
��Auto=�6G   z�5      �� 5   "   $	 -1Q�61   .��5      �� #��z��6&   $ 0.5,0.5&�6D   .��6d   z�5   "   �� 5   &   $	 -1Q�65   .��5   ;   5      5      5      5      5      5       .��5!      ]� .+�5"   
   o� $	��Top=�6   .@�5#      m� $��파일��6   .@�5$      m� $��열기��6   
 m� InputGestureText$
 Ctrl+O��6'    m� Icon 5%      �� 5&      $D��>/SensorMonitorWPFApp;component/image/MenuSubItemOpen.Image.png��6    5(      m� 5)      $��저장��6   $
 Ctrl+S��6'    5*      �� 5+      $D��>/SensorMonitorWPFApp;component/image/MenuSubItemSave.Image.png��6    5-      �� 5.      m� 5/      -   5         m�Name$ MenuSubItemClose��5/      $��	끝내기��65   $
 Alt+F4��6B   50      m� 51      $��시뮬레이션��6   .@�52      m� $��시작��6   $
 Alt+S��6'   m� 53      $��중지��6   $
 Alt+T��6'   54      m� 55      $��	도움말��6   .@�56      m� -   5        $ MenuSubItemInfo��56      $��	정보...��64   57      58      � 59   
   $��10q�6   $	��Top=�6    � ColumnDefinitions 5:      �� 5;      $��2* �6#   �� 5<      $��10 �6#   �� 5=      $��1* �6#   .+�5?      � $��0��6   .+�5@      �  � RowDefinitions 5A      �� 5B      $��30 �6(   �� 5C      $��* �6(   �� 5D      $	��100 �6(    5F      �� 5G      �� 5H      �� 5I      .+�5L      �� -   5         ��Name$ ConnectTime��5L       $��0��65   $��0��6B   $��2��6R   $��연결시간 : ��5M       $��5q�6/   �� 5N      -   5         ��Name$ 	SensorCnt��5N      $��0��61   $��2��6>    �� 
IsReadOnly . 6N   �� 5O      $��포토레지스터��6   $��1��6/   $��0��6<   $��3��6L   $��0,5,0,5q�5P      .��5Q      �� .+�5R      � -   5         �Name$ PrgValue��5R   *   $��25��6<    � Maximum$
 1023Q�6H   �� 5S      -   5        $ 	RecvValue��5S   (   $��Center=�6;   $��0��6X   5T      5U      �� 5X      -   5        $ RtbLog��5X      $��2��6.   $��0��6;   $��3��6K   $��0,5,0,0q�6_   $	��100��6p   " �� VerticalScrollBarVisibility$ Visible=�5Y       �� TextWrapping$
 Wrap=�6D    �� AcceptsReturn .  . ��. #��[  5Z   U   5^      5_      �� 5a      $��2��6   .+�5b      �� $��포트��6   .��5c      �� .+�5d      �� -   5         ��Name$ Serial��5d   #   $��2,5,2,5q�6X    �� SelectedItem 63   �� *SelPortName+6X   �� 5e      -	   5         ��Name$ ConnPort��5e   !   $��Connect��63   $��2,5,2,5q�6E   �� 5f      -
   5        $ DisPort��5f   !   $��
Disconnect��62   $��2,5,2,5q�6G   �� 5g      $
��Port��6!   $��70��60   $��2,5,2,5q�6<   5h      5i      5j      5k        OxyPlot.Wpf.Plot  5l   
   $	��300��6   $	��Top=�6    $��10q�65      Series 5m        OxyPlot.Wpf.LineSeries  5n      ��6!   �� *test+5p      � 5q   
   $��150,0,150,0q�6   $	��Top=�6$    5r      �� 5s      �� 5t      .+�5v      �� $��0��6   $��View ALL��6%   $��
10,10,10,0q�68   $��50��6L   $	��Top=�6X   �� 5w      $��1��6   $
��ZOOM��6%   $��
10,10,10,0q�64   $��50��6H   $	��Top=�6T   5x      5y      5z      