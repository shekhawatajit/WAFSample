import React, { useState, useEffect } from "react";
import { Stack, Label, IStackTokens, IStackStyles, DetailsList, SelectionMode, DetailsListLayoutMode } from '@fluentui/react';
import './App.css';
import { getTheme } from '@fluentui/react';
import { FontSizes } from '@fluentui/theme';
const theme = getTheme();
const stackTokens: IStackTokens = { childrenGap: 15 };
const stackStyles: Partial<IStackStyles> = {
  root: {
    width: '960px',
    margin: '0 auto',
    background: theme.semanticColors.bodyStandoutBackground
  },
};

export interface IListItem {
  Id: string;
  productName: string;
  department: string;
  color: string;
  price: number;
  productAdjective: string;
  productMaterial: string;
  producttype: string;
}
const columns = [
  { key: 'column1', name: 'Product Name', fieldName: 'productName', minWidth: 100, isResizable: true },
  { key: 'column2', name: 'Department', fieldName: 'department', minWidth: 100, isResizable: true },
  { key: 'column3', name: 'Color', fieldName: 'color', minWidth: 100, isResizable: true },
  { key: 'column4', name: 'Price', fieldName: 'price', minWidth: 100, isResizable: true },
  { key: 'column5', name: 'Product Adjective', fieldName: 'productAdjective', minWidth: 100, isResizable: true },
  { key: 'column6', name: 'Product Material', fieldName: 'productMaterial', minWidth: 100, isResizable: true },
  { key: 'column7', name: 'Product Type', fieldName: 'producttype', minWidth: 100, isResizable: true },
];
export const App: React.FunctionComponent = () => {
  const [items, setItems] = useState<IListItem[]>();
  useEffect(() => {
    const updateItems = async () => {
      fetch("https://localhost:7196/api/ProductItems", {
        "method": "GET"
      })
        .then(response => response.json())
        .then(json => {
          setItems(json);
          console.log(json);
        })
    };
    updateItems();
  }, []);

  return (
    <Stack verticalFill wrap styles={stackStyles} tokens={stackTokens}>
      <Stack style={{ boxShadow: theme.effects.elevation8, minHeight: 48 }}>
        <Label style={{ fontSize: FontSizes.size28 }}>Header Here</Label>
      </Stack>
      <Stack>
        {items != undefined &&
        <DetailsList items={items!}
          selectionMode={SelectionMode.none}
          setKey="none"
          layoutMode={DetailsListLayoutMode.justified}
          isHeaderVisible={true}
          columns={columns}
        />}
      </Stack>
    </Stack>
  );
};
