import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { SafeAreaProvider } from 'react-native-safe-area-context';
import Icon from 'react-native-vector-icons/MaterialCommunityIcons';

import DashboardScreen from './src/screens/DashboardScreen';
import CropManagementScreen from './src/screens/CropManagementScreen';
import LivestockManagementScreen from './src/screens/LivestockManagementScreen';
import TaskManagementScreen from './src/screens/TaskManagementScreen';
import InventoryScreen from './src/screens/InventoryScreen';
import FinancialScreen from './src/screens/FinancialScreen';
import ReportScreen from './src/screens/ReportScreen';

const Tab = createBottomTabNavigator();

export default function App() {
  return (
    <SafeAreaProvider>
      <NavigationContainer>
        <Tab.Navigator
          screenOptions={({ route }) => ({
            tabBarIcon: ({ focused, color, size }) => {
              let iconName;

              if (route.name === 'Dashboard') {
                iconName = focused ? 'view-dashboard' : 'view-dashboard-outline';
              } else if (route.name === 'Crops') {
                iconName = focused ? 'sprout' : 'sprout-outline';
              } else if (route.name === 'Livestock') {
                iconName = focused ? 'cow' : 'cow-outline';
              } else if (route.name === 'Tasks') {
                iconName = focused ? 'clipboard-check' : 'clipboard-check-outline';
              } else if (route.name === 'Inventory') {
                iconName = focused ? 'package-variant' : 'package-variant-outline';
              } else if (route.name === 'Financial') {
                iconName = focused ? 'cash' : 'cash-outline';
              } else if (route.name === 'Report') {
                iconName = focused ? 'file-chart' : 'file-chart-outline';
              }

              return <Icon name={iconName} size={size} color={color} />;
            },
          })}
        >
          <Tab.Screen name="Dashboard" component={DashboardScreen} />
          <Tab.Screen name="Crops" component={CropManagementScreen} />
          <Tab.Screen name="Livestock" component={LivestockManagementScreen} />
          <Tab.Screen name="Tasks" component={TaskManagementScreen} />
          <Tab.Screen name="Inventory" component={InventoryScreen} />
          <Tab.Screen name="Financial" component={FinancialScreen} />
          <Tab.Screen name="Report" component={ReportScreen} />
        </Tab.Navigator>
      </NavigationContainer>
    </SafeAreaProvider>
  );
}
