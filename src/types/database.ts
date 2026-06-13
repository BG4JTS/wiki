// 原样WIKI 数据库类型定义

export interface User {
  id: string;
  email?: string;
  user_metadata?: Record<string, unknown>;
  app_metadata?: Record<string, unknown>;
}

export interface Episode {
  id: number;
  episode_number: number;
  title: string;
  publish_date: string;
  duration: number;
  description: string;
  transcript: string;
  created_at: string;
}

export interface Timeline {
  id: number;
  episode_id: number;
  timestamp_sec: number;
  title: string;
  description: string;
}

export interface Comment {
  id: number;
  episode_id: number;
  user_id: string;
  content: string;
  parent_id: number | null;
  likes: number;
  created_at: string;
  user_profile?: UserProfile | null;
  replies?: Comment[];
}

export interface UserProfile {
  id: string;
  username: string;
  avatar_url: string;
  bio: string;
}

export interface UserContribution {
  id: number;
  episode_id: number;
  user_id: string;
  content_type: "link" | "note" | "image_url";
  content: string;
  description: string;
  votes: number;
  created_at: string;
  user_profile?: UserProfile | null;
}

// ---- Row / Insert / Update 类型 ----
type EpisodeRow = Episode;
type EpisodeInsert = Omit<EpisodeRow, "id" | "created_at">;
type EpisodeUpdate = Partial<EpisodeInsert>;

type TimelineRow = Timeline;
type TimelineInsert = Omit<TimelineRow, "id">;
type TimelineUpdate = Partial<TimelineInsert>;

type CommentRow = Comment;
type CommentInsert = Omit<CommentRow, "id" | "created_at" | "likes">;
type CommentUpdate = Partial<Omit<CommentInsert, "user_id">>;

type UserProfileRow = UserProfile;
type UserProfileInsert = Omit<UserProfileRow, "id">;
type UserProfileUpdate = Partial<UserProfileInsert>;

type UserContributionRow = UserContribution;
type UserContributionInsert = Omit<UserContributionRow, "id" | "created_at" | "votes">;
type UserContributionUpdate = Partial<Omit<UserContributionInsert, "user_id">>;


// ---- 坑 & 填坑 ----
export interface Pit {
  id: number;
  episode_id: number | null;
  user_id: string;
  title: string;
  description: string;
  status: "open" | "pending" | "filled";
  timestamp_sec: number | null;
  up_votes: number;
  down_votes: number;
  created_at: string;
  user_profile?: UserProfile | null;
}

export interface PitFill {
  id: number;
  pit_id: number;
  episode_id: number | null;
  timestamp_sec: number | null;
  user_id: string;
  description: string;
  up_votes: number;
  down_votes: number;
  created_at: string;
  user_profile?: UserProfile | null;
}

export type Database = {
  public: {
    Tables: {
      episodes: { Row: EpisodeRow; Insert: EpisodeInsert; Update: EpisodeUpdate; Relationships: [] };
      timelines: { Row: TimelineRow; Insert: TimelineInsert; Update: TimelineUpdate; Relationships: [] };
      comments: { Row: CommentRow; Insert: CommentInsert; Update: CommentUpdate; Relationships: [] };
      user_profiles: { Row: UserProfileRow; Insert: UserProfileInsert; Update: UserProfileUpdate; Relationships: [] };
      user_contributions: { Row: UserContributionRow; Insert: UserContributionInsert; Update: UserContributionUpdate; Relationships: [] };
      pits: { Row: Pit; Insert: Omit<Pit, "id" | "created_at" | "up_votes" | "down_votes">; Update: Partial<Omit<Pit, "id" | "user_id">>; Relationships: [] };
      pit_votes: { Row: { id: number; pit_id: number; user_id: string; vote_type: "up" | "down"; created_at: string }; Insert: Omit<{ id: number; pit_id: number; user_id: string; vote_type: "up" | "down"; created_at: string }, "id" | "created_at">; Update: never; Relationships: [] };
      pit_fills: { Row: PitFill; Insert: Omit<PitFill, "id" | "created_at" | "up_votes" | "down_votes">; Update: Partial<Omit<PitFill, "id" | "user_id">>; Relationships: [] };
      pit_fill_votes: { Row: { id: number; fill_id: number; user_id: string; vote_type: "up" | "down"; created_at: string }; Insert: Omit<{ id: number; fill_id: number; user_id: string; vote_type: "up" | "down"; created_at: string }, "id" | "created_at">; Update: never; Relationships: [] };
    };
    Views: Record<string, never>;
    Functions: Record<string, never>;
    Enums: Record<string, never>;
    CompositeTypes: Record<string, never>;
  };
};


