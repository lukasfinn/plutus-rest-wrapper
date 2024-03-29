{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Sample.Contracts.Types where

import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics (Generic)
import Ledger
import Playground.Contract (ToSchema)
import qualified Data.OpenApi.Schema as OpenApi (ToSchema)
import Prelude (String)
import qualified Prelude
import PlutusTx.Prelude
import PlutusTx.Builtins (BuiltinByteString)
import PlutusTx.Builtins.Class (stringToBuiltinByteString)
import Prelude (Show (..))

data EscrowParams = EscrowParams
  { buyer :: PaymentPubKeyHash -- the first party - buyer in this escrow
  , seller :: PaymentPubKeyHash -- the counterparty - seller in this escrow
  , lovelaceAmt :: Integer -- the escrow amount in lovelace
  , finaliseTime :: POSIXTime -- the time before which the buyer can withdraw from the trade
  , endTime :: POSIXTime -- the time after which the funds can be claimed by seller
  }
  deriving (Eq, Ord, Prelude.Eq, Prelude.Ord, Show, Generic, ToJSON, FromJSON, ToSchema, OpenApi.ToSchema)
