// 原样WIKI 数据库类型定义
// 与 Supabase 表结构严格对应

export interface Episode {
  id: number;
  episode_number: number;
  title: string;
  publish_date: string;
  duration: number; // 秒数
  description: string;
  transcript: string; // 完整文稿
  created_at: string;
}

export interface Timeline {
  id: number;
  episode_id: number;
  timestamp_sec: number;
  title: string; // 章节标题
  description: string;
}

export interface Comment {
  id: number;
  episode_id: number;
  user_id: string;
  content: string;
  parent_id: number | null; // 支持嵌套回复
  likes: number;
  created_at: string;
  // 关联字段（JOIN 查询时）
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
