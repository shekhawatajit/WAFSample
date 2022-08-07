import React, { useState, useEffect } from "react";
import { Stack, Label, IStackTokens, IStackStyles } from '@fluentui/react';
import { Login } from '@microsoft/mgt-react';
import './App.css';
import { getTheme } from '@fluentui/react';
import { FontSizes } from '@fluentui/theme';
import { Providers, ProviderState } from '@microsoft/mgt-element';
import { Dashboard } from './Dashboard/Dashboard';
const theme = getTheme();
const stackTokens: IStackTokens = { childrenGap: 15 };
const stackStyles: Partial<IStackStyles> = {
  root: {
    width: '960px',
    margin: '0 auto',
    background: theme.semanticColors.bodyStandoutBackground
  },
};

export const App: React.FunctionComponent = () => {
  const [isSignedIn, setIsSignedIn] = useState(false);


    useEffect(() => {
      const updateState = () => {
        const provider = Providers.globalProvider;
        setIsSignedIn(provider && provider.state === ProviderState.SignedIn);
      };

      Providers.onProviderUpdated(updateState);
      updateState();

      return () => {
        Providers.removeProviderUpdatedListener(updateState);
      }
    }, []);

  return (
    <Stack verticalFill wrap styles={stackStyles} tokens={stackTokens}>
      <Stack horizontal style={{ boxShadow: theme.effects.elevation8, minHeight: 48 }}>
        <Stack.Item grow={2}>
          <Label style={{ fontSize: FontSizes.size28 }}>Header</Label>
        </Stack.Item>
        <Stack.Item grow >
          <Login />
        </Stack.Item>
      </Stack>
      <Stack>
        {isSignedIn && <Dashboard></Dashboard>}
      </Stack>
    </Stack>
  );
};
