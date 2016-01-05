{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
module Github.Data.Gists where

import Github.Data.Definitions
import Github.Data.Id
import Github.Data.Name

import Control.DeepSeq (NFData)
import Data.Data       (Data, Typeable)
import GHC.Generics    (Generic)

data Gist = Gist {
   gistUser        :: GithubOwner
  ,gistGitPushUrl  :: String
  ,gistUrl         :: String
  ,gistDescription :: Maybe String
  ,gistCreatedAt   :: GithubDate
  ,gistPublic      :: Bool
  ,gistComments    :: Int
  ,gistUpdatedAt   :: GithubDate
  ,gistHtmlUrl     :: String
  ,gistId          :: Name Gist
  ,gistFiles       :: [GistFile]
  ,gistGitPullUrl  :: String
} deriving (Show, Data, Typeable, Eq, Ord, Generic)

instance NFData Gist

data GistFile = GistFile {
   gistFileType     :: String
  ,gistFileRawUrl   :: String
  ,gistFileSize     :: Int
  ,gistFileLanguage :: Maybe String
  ,gistFileFilename :: String
  ,gistFileContent  :: Maybe String
} deriving (Show, Data, Typeable, Eq, Ord, Generic)

instance NFData GistFile

data GistComment = GistComment {
   gistCommentUser      :: GithubOwner
  ,gistCommentUrl       :: String
  ,gistCommentCreatedAt :: GithubDate
  ,gistCommentBody      :: String
  ,gistCommentUpdatedAt :: GithubDate
  ,gistCommentId        :: Id GistComment
} deriving (Show, Data, Typeable, Eq, Ord, Generic)

instance NFData GistComment
