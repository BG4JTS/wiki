// 原样WIKI 数据库类型定义
// 与 Supabase 表结构严格对应

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
  user_profile?: UserProfile;
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
  content_type: 'link' | 'note' | 'image_url';
  content: string;
  description: string;
  votes: number;
  created_at: string;
  user_profile?: UserProfile;
}

export type Database = {
  public: {
    Tables: {
      episodes: { Row: Episode };
      timelines: { Row: Timeline };
      comments: { Row: Comment };
      user_profiles: { Row: UserProfile };
      user_contributions: { Row: UserContribution };
    };
  };
};
